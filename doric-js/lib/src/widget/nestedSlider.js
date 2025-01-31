var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
/*
 * Copyright [2019] [Doric.Pub]
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Group, Property } from '../ui/view';
export class NestedSlider extends Group {
    addSlideItem(view) {
        this.addChild(view);
    }
    slidePage(context, page, smooth = false) {
        return this.nativeChannel(context, "slidePage")({ page, smooth });
    }
    getSlidedPage(context) {
        return this.nativeChannel(context, "getSlidedPage")();
    }
}
__decorate([
    Property,
    __metadata("design:type", Function)
], NestedSlider.prototype, "onPageSlided", void 0);
__decorate([
    Property,
    __metadata("design:type", Boolean)
], NestedSlider.prototype, "scrollable", void 0);
__decorate([
    Property,
    __metadata("design:type", Boolean)
], NestedSlider.prototype, "bounces", void 0);
__decorate([
    Property,
    __metadata("design:type", Boolean)
], NestedSlider.prototype, "scrollsToTop", void 0);
