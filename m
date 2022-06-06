Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 834907E
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 07:19:50 +0000 (UTC)
Received: by ajax-webmail-mail-app4 (Coremail) ; Mon, 6 Jun 2022 15:11:39
 +0800 (GMT+08:00)
X-Originating-IP: [106.117.78.144]
Date: Mon, 6 Jun 2022 15:11:39 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, davem@davemloft.net, kuba@kernel.org, 
	alexander.deucher@amd.com, broonie@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: Fix sleep in atomic context bug in
 dm_fsync_timer_callback
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <Yp2T7xSM8YX7lX0/@kroah.com>
References: <20220520061541.14785-1-duoming@zju.edu.cn>
 <Yp2T7xSM8YX7lX0/@kroah.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <6c014f68.52c9b.18137daddd9.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cS_KCgDHnyKrqJ1ixlFVAQ--.31916W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgcNAVZdtaDwcwABsV
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGVsbG8sCgpPbiBNb24sIDYgSnVuIDIwMjIgMDc6NDM6MTEgKzAyMDAgZ3JlZyBrLWggd3JvdGU6
Cgo+IE9uIEZyaSwgTWF5IDIwLCAyMDIyIGF0IDAyOjE1OjQxUE0gKzA4MDAsIER1b21pbmcgWmhv
dSB3cm90ZToKPiA+IFRoZXJlIGFyZSBzbGVlcCBpbiBhdG9taWMgY29udGV4dCBidWdzIHdoZW4g
ZG1fZnN5bmNfdGltZXJfY2FsbGJhY2sgaXMKPiA+IGV4ZWN1dGluZy4gVGhlIHJvb3QgY2F1c2Ug
aXMgdGhhdCB0aGUgbWVtb3J5IGFsbG9jYXRpb24gZnVuY3Rpb25zIHdpdGgKPiA+IEdGUF9LRVJO
RUwgcGFyYW1ldGVyIGFyZSBjYWxsZWQgaW4gZG1fZnN5bmNfdGltZXJfY2FsbGJhY2sgd2hpY2gg
aXMgYQo+ID4gdGltZXIgaGFuZGxlci4gVGhlIGNhbGwgcGF0aHMgdGhhdCBjb3VsZCB0cmlnZ2Vy
IGJ1Z3MgYXJlIHNob3duIGJlbG93Ogo+ID4gCj4gPiAgICAgKGludGVycnVwdCBjb250ZXh0KQo+
ID4gZG1fZnN5bmNfdGltZXJfY2FsbGJhY2sKPiA+ICAgd3JpdGVfbmljX2J5dGUKPiA+ICAgICBr
emFsbG9jKHNpemVvZihkYXRhKSwgR0ZQX0tFUk5FTCk7IC8vbWF5IHNsZWVwCj4gPiAgIHdyaXRl
X25pY19kd29yZAo+ID4gICAgIGt6YWxsb2Moc2l6ZW9mKGRhdGEpLCBHRlBfS0VSTkVMKTsgLy9t
YXkgc2xlZXAKPiA+IAo+ID4gVGhpcyBwYXRjaCBjaGFuZ2VzIGFsbG9jYXRpb24gbW9kZSBmcm9t
IEdGUF9LRVJORUwgdG8gR0ZQX0FUT01JQwo+ID4gaW4gb3JkZXIgdG8gcHJldmVudCBhdG9taWMg
Y29udGV4dCBzbGVlcGluZy4gVGhlIEdGUF9BVE9NSUMgZmxhZwo+ID4gbWFrZXMgbWVtb3J5IGFs
bG9jYXRpb24gb3BlcmF0aW9uIGNvdWxkIGJlIHVzZWQgaW4gYXRvbWljIGNvbnRleHQuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IER1b21pbmcgWmhvdSA8ZHVvbWluZ0B6anUuZWR1LmNuPgo+IAo+
IFdoYXQgY29tbWl0IGlkIGRvZXMgdGhpcyBmaXg/CgpUaGFua3MgZm9yIHlvdXIgdGltZSBhbmQg
cmVwbHkhIApUaGUgY29tbWl0IGlkIHRoaXMgcGF0Y2ggZml4IGlzIDhmYzg1OThlNjFmNiAoIlN0
YWdpbmc6IEFkZGVkIFJlYWx0ZWsgcnRsODE5MnUgZHJpdmVyIHRvIHN0YWdpbmciKS4KIAo+IEFu
ZCBob3cgZGlkIHlvdSBmaW5kIHRoaXMgaXNzdWU/ICBEaWQgeW91IHJ1biB0aGUgY29kZSB0byB2
ZXJpZnkgaXQKPiBzdGlsbCB3b3JrcyBwcm9wZXJseT8KCkkgZmluZCB0aGlzIGlzc3VlIGJ5IHdy
aXRpbmcgY29kZXFsIHF1ZXJ5LiBJIGFtIHRyeWluZyB0byB1c2UgdXNiIHJhdy1nYWRnZXQgdG8g
c2ltdWxhdGUKcnRsODE5MnUgY2FyZCBpbiBvcmRlciB0byB0ZXN0IHRoaXMgY29kZS4KCldoYXRg
cyBtb3JlLCBJIGZvdW5kIHRoZSB1c2JfY29udHJvbF9tc2coKSB3aXRoIEdGUF9OT0lPIHBhcmFt
ZXRlciBpbiB3cml0ZV9uaWNfYnl0ZSgpIAphbmQgd3JpdGVfbmljX2R3b3JkKCkgbWF5IGFsc28g
c2xlZXAuIFNvIEkgdGhpbmsgdXNlIHRoZSBkZWxheWVkIHF1ZXVlIHRvIHJlcGxhY2UgdGltZXIK
aXMgYmV0dGVyLiAKCkJlc3QgcmVnYXJkcywKRHVvbWluZyBaaG91CgoK
