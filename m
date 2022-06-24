Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A729823A1
	for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 06:10:53 +0000 (UTC)
Received: by ajax-webmail-mail-app3 (Coremail) ; Fri, 24 Jun 2022 14:02:56
 +0800 (GMT+08:00)
X-Originating-IP: [10.190.70.246]
Date: Fri, 24 Jun 2022 14:02:56 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, davem@davemloft.net, 
	alexander.deucher@amd.com, kuba@kernel.org, broonie@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192u: Fix sleep in atomic context bug
 in dm_fsync_timer_callback
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <YrQ2gXtX2FOkyNgu@kroah.com>
References: <20220623055912.84138-1-duoming@zju.edu.cn>
 <YrQ2gXtX2FOkyNgu@kroah.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <1ddff589.e0f1.181944e6c1a.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cC_KCgDXT0OQU7VieOfKAA--.1674W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgYLAVZdtaYJ8wACsu
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGVsbG8sCgpPbiBUaHUsIDIzIEp1biAyMDIyIDExOjQ2OjQxICswMjAwIEdyZWcgS0ggd3JvdGU6
Cgo+IE9uIFRodSwgSnVuIDIzLCAyMDIyIGF0IDAxOjU5OjEyUE0gKzA4MDAsIER1b21pbmcgWmhv
dSB3cm90ZToKPiA+IFRoZXJlIGFyZSBzbGVlcCBpbiBhdG9taWMgY29udGV4dCBidWdzIHdoZW4g
ZG1fZnN5bmNfdGltZXJfY2FsbGJhY2sgaXMKPiA+IGV4ZWN1dGluZy4gVGhlIHJvb3QgY2F1c2Ug
aXMgdGhhdCB0aGUgbWVtb3J5IGFsbG9jYXRpb24gZnVuY3Rpb25zIHdpdGgKPiA+IEdGUF9LRVJO
RUwgb3IgR0ZQX05PSU8gcGFyYW1ldGVycyBhcmUgY2FsbGVkIGluIGRtX2ZzeW5jX3RpbWVyX2Nh
bGxiYWNrCj4gPiB3aGljaCBpcyBhIHRpbWVyIGhhbmRsZXIuIFRoZSBjYWxsIHBhdGhzIHRoYXQg
Y291bGQgdHJpZ2dlciBidWdzIGFyZQo+ID4gc2hvd24gYmVsb3c6Cj4gPiAKPiA+ICAgICAoaW50
ZXJydXB0IGNvbnRleHQpCj4gPiBkbV9mc3luY190aW1lcl9jYWxsYmFjawo+ID4gICB3cml0ZV9u
aWNfYnl0ZQo+ID4gICAgIGt6YWxsb2Moc2l6ZW9mKGRhdGEpLCBHRlBfS0VSTkVMKTsgLy9tYXkg
c2xlZXAKPiA+ICAgICB1c2JfY29udHJvbF9tc2cKPiA+ICAgICAgIGttYWxsb2MoLi4sIEdGUF9O
T0lPKTsgLy9tYXkgc2xlZXAKPiA+ICAgd3JpdGVfbmljX2R3b3JkCj4gPiAgICAga3phbGxvYyhz
aXplb2YoZGF0YSksIEdGUF9LRVJORUwpOyAvL21heSBzbGVlcAo+ID4gICAgIHVzYl9jb250cm9s
X21zZwo+ID4gICAgICAga21hbGxvYyguLiwgR0ZQX05PSU8pOyAvL21heSBzbGVlcAo+ID4gCj4g
PiBUaGlzIHBhdGNoIHVzZXMgZGVsYXllZCB3b3JrIHRvIHJlcGxhY2UgdGltZXIgYW5kIG1vdmVz
IHRoZSBvcGVyYXRpb25zCj4gPiB0aGF0IG1heSBzbGVlcCBpbnRvIHRoZSBkZWxheWVkIHdvcmsg
aW4gb3JkZXIgdG8gbWl0aWdhdGUgYnVncy4KPiA+IAo+ID4gRml4ZXM6IDhmYzg1OThlNjFmNiAo
IlN0YWdpbmc6IEFkZGVkIFJlYWx0ZWsgcnRsODE5MnUgZHJpdmVyIHRvIHN0YWdpbmciKQo+ID4g
U2lnbmVkLW9mZi1ieTogRHVvbWluZyBaaG91IDxkdW9taW5nQHpqdS5lZHUuY24+Cj4gPiAtLS0K
PiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAgIC0gVXNlIGRlbGF5ZWQgd29yayB0byByZXBsYWNlIHRp
bWVyLgo+IAo+IERpZCB5b3UgdGVzdCB0aGlzIHdpdGggcmVhbCBoYXJkd2FyZSB0byB2ZXJpZnkg
aXQgc3RpbGwgd29ya3M/CgpJIGFtIHRlc3RpbmcgdGhpcyBhbmQgSSB3aWxsIGdpdmUgeW91IGZl
ZWRiYWNrIHdpdGhpbiBvbmUgb3IgdHdvIGRheXMuCgpCZXN0IHJlZ2FyZHMsCkR1b21pbmcgWmhv
dQ==
