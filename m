Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053A620
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648715617;
	bh=T8WvPBmgjqdrR0PwDH2uCZLcFCNRLTpq0uGOSav5bEU=;
	h=Date:From:To:Cc:Subject:References;
	b=qR5EpgDENP37+xS4xFh3MvIGCBYcwYzjYXx1X78hL1S2wjUOPgH8FElOzMc03ALSo
	 ilYnS9SzXxifVYqiWUig1y9AZa3sF97hDFIE+HONbdvNT6E/Xal+W12TL8GQ2jvCvX
	 /YVbRlrK5Mene8rE7I6s+oFVWWMKU502QEc4Y49w=
Received: from LAPTOP-4BSPBRI7 ([59.172.176.225])
	by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
	id 86323CAE; Thu, 31 Mar 2022 16:33:35 +0800
X-QQ-mid: xmsmtpt1648715615th7dqjssg
Message-ID: <tencent_7E870E856738AA52C5FF04C81D735AEE1206@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCt5il7mVOFmu6uKP0gJOVD+GPp1a7uexg1QZDxJiimi1AuqufNTK
	 cSmek1Bm3rIU8k2B5gouX63wjws+utK/DNWP7jl5FVeIThFcn4uooCKLI0ungnbUjUvbD6ciM5cY
	 wqyQoMyLO0BiPQsoviqtCh3vElMWMunYKSrz3KMGHdXOFi2naQsACATOdVGj/fq4GrTNrL2NFuPj
	 EHnekupwCHDlhBvA/dpoMO5bIEvQGPP5V/kRV1VnyrKoCBluPqsFrijWxCOqA43k3dDAuUDfRAy1
	 GAnlzu59rTAvCmAOGGHj1QB0A2IqMWPUdCZxvMmzMKnjLZKfAeAGOG55MZRCojA4ris6lJfcWz8J
	 nKavl80i2ba9a/flVZfX5BpOG47BI6XM08g0bE+eF1ByY74rilFtfjtI358NvBzmZ8mUIptee/lH
	 pmzAoepccZHK+JVK/2n23y7C5hZKnTBUtGb/hD0AotxSUuC5FwREcTSym/+ko2bUEftiTpuMHh/+
	 CWPDnizJ1Z4QPZEPuy/u4q6qbLKUuLwjGfSwyZAijHrm977qZ6K8s0nGltKlj7zSQRn1e0ZTjxMb
	 sYcYCXB0M/BO9Pf24qMsdSwKLNjYyqBo3FKEtS+mcHjDYTo9d+9R/WDjsoW9LV/v2bMlCm2St59o
	 1GQs3IbrGLfE+uZXKvHXJESbgChPgiqy1myY9AS2AOLLxoFM9+tdS30B8D+UjuQhPHhyaGAqbAAU
	 KKNLLN749WrdG8RSCoZibSC7QhcLiIalF/Qg5uC1z2Do36m3eFYHNB7Hu566hTAO2JIM7NGO13NN
	 MRIrNQ0olX6DV63J7qY8J3cZui1vfYl1Yke4P1U08o9r0/p/I5CZaHW57r4P7Vd4sBtnjfphaQ/t
	 HIRMkpy4j7hHH6hmE4bVOEl0lTeak5o5emfioF6lyYHFNI883MN5WrS05atJEi4g==
Date: Thu, 31 Mar 2022 16:33:37 +0800
From: "Xiaoke Wang" <xkernel.wang@foxmail.com>
To: dan.carpenter <dan.carpenter@oracle.com>
Cc: larry.finger <Larry.Finger@lwfinger.net>, 
	phil <phil@philpotter.co.uk>, 
	gregkh <gregkh@linuxfoundation.org>, 
	linux-staging <linux-staging@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH 2/2] staging: r8188eu: fix potential memory leak in _rtw_init_xmit_priv()
References: <tencent_12789CD2DEBF33C818B3542E170737854506@qq.com>, 
	<tencent_2F72CC5068850B2BEDFC2B8058303FE6520A@qq.com>, 
	<20220331073555.GK3293@kadam>, 
	<2022033116214474301568@foxmail.com>
X-Priority: 3
X-GUID: 8EB87ADA-A700-44D8-BD79-8410E945CA49
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.116[cn]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-OQ-MSGID: <2022033116333655762473@foxmail.com>
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Ck9uIFRodSwgMzEgTWFyIDIwMjIgMTY6MjE6NDMgKzA4MDAsIHhrZXJuZWwud2FuZ0Bmb3htYWls
LmNvbSB3cm90ZToKPkluIGZhY3QsIHRoaXMgaXMgY29uc2lkZXJpbmcgdGhhdCB3ZSBkbyBub3Qg
a25vdyB3aGVyZSBpcyB0aGUgZmFpbHVyZQo+ZnJvbS4gSW4gcnR3X29zX3htaXRfcmVzb3VyY2Vf
YWxsb2MoKSwgdGhlIGZhaWx1cmUgY2FuIGZyb20gCj4KPj4gcHhtaXRidWYtPnBhbGxvY2F0ZWRf
YnVmID0ga3phbGxvYyhhbGxvY19zeiwgR0ZQX0tFUk5FTCk7Cj4KPiAsIGJ1dCBhbHNvIGNhbiBm
cm9tIAo+Cj4+IAkJcHhtaXRidWYtPnB4bWl0X3VyYltpXSA9IHVzYl9hbGxvY191cmIoMCwgR0ZQ
X0tFUk5FTCk7Cj4KPiBTbyBpZiB3ZSBkbyBub3QgaGFuZGxlIHRoZSBjdXJyZW50IGZhaWxlZCBp
dGVtIGFuZCBqdXN0IHNraXAgaXQsIHRoZW4gc29tZQo+IG1lbW9yeSBtYXkgYmUgaWdub3JlZC4K
CgoKTWF5YmUgdGhpcyBzaG91bGQgYmUgdGhlIHByb2JsZW0gb2YgcnR3X29zX3htaXRfcmVzb3Vy
Y2VfYWxsb2MoKSBhcyBpdApkb2VzIHByb3Blcmx5IGhhbmRsZSB0aGUgZXJyb3IgZnJvbSBpdC4K
QW55d2F5LCBJIHdpbGwgYXR0ZW1wdCB0byBmaXggdGhlbS4KCgpSZWdhcmRzLAoKCgpYaWFva2Ug
V2FuZwoKCgoK

