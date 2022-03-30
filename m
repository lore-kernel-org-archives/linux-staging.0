Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC377C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648642461;
	bh=62DQtLJbcRe4Q7lrF3lSrWfopGY8KB/521uYlbAIW58=;
	h=Date:From:To:Cc:Subject:References;
	b=evhFKlXW+qCEYctM+7ez5N73MKtwNajPSrbqIBBnCTi/2Bgeq20mXkNfPzrX6rTg1
	 i09otUWqNi7KO21OhF2aq/Q5A41gtH6w8kDf9B4bTLRazw6xlCMUTtyOJdScmiB1Vz
	 AiAqwMP2tEzhe5BWGA8rbEIQs9fcTalEVclhJ57s=
Received: from LAPTOP-4BSPBRI7 ([59.172.176.225])
	by newxmesmtplogicsvrszc7.qq.com (NewEsmtp) with SMTP
	id 39336282; Wed, 30 Mar 2022 20:14:19 +0800
X-QQ-mid: xmsmtpt1648642459t1kvqcp29
Message-ID: <tencent_C48F29D1FC7F82743293E5F2726452F0860A@qq.com>
X-QQ-XMAILINFO: NSObNE1Kae7ZxNUCXJAOV5AVZv2OOg58Ri3TSPR1Fi9F+40KsWvozgsdv1bmGl
	 4veG6uy76/Q8R/PEMUuSW5jB+IaV4PdmDfluZXOyQF5zX4h0YeqoMba3raj1zhQzDLzPcpLEvGca
	 GaKhGRPPRSBEeaftOwhLD6/tDltqWDMHcvLb1zNe7OV99waeEkksGuFWxOtCIkrkdHK/loBd6iaP
	 ayu+gnUFobP+JRoMqrFCv9K1jlKW2S9/+ufigQanx2md+IeStFps7e3BeT2hxUPQLz4zfaQnmMAQ
	 S7Z1hkdg3pMp+Nza/if1cEFfXgpHl+dnDsBbEbxBZtfGR3v+2cbjFkms9dC726F5nstTTCsBjFGR
	 dbkOozzllgSmBtj+8Wtk3dZk/8BOsK1H3kj9pVjIFVGMgo+tGyyttISWZPAMOsipTde3RcF1UUmd
	 A7zEQANfuTmD2T88m0mFbmLbtNGDOudEMqIaFzAQsaJ5MlJlX0L6Bp3Z4buA+w6Pc4yb/w1O1rwv
	 uEe/RxEQ9k4XGY7cm5OD6jkY7yshUTM+Kd/45ttZCn9JrgiH/kctHlujtbjAQNtjYPLv1U/K6Bg/
	 hAO7etZgyeXl1boNTkUDkU7vW/afdpS1lBDGCwPPjAdZU3SC1pA0G48L/3a3633sn+GxutLNFYAF
	 F2awKM1LDixaFLgElEwYtAFGFzI8XX9qwuloj9mCLQUb0qxYS2xl5lZkCoOg03SxQ/vYQ+T7q5X3
	 hwBQcwMKVBleiLECCfl4bszbM8ekDHnbF/45srE/KB0cowCB4CY4k7meKXdOIvLrx1khNJ252ajp
	 +crVfqmYxVMQuq+S2XVpt3Yb7Hckb3uUTyz+8ccLf+8F3n5S7AU/lk5emL1QKShmVLYlrNiB1L3H
	 SRGQqPK26F+drEREyMhwVbhNczUlPeuMi22kE6oUulZ7s9AwxpGEpD6z4Jzpe6MO1r+PimsZRz
Date: Wed, 30 Mar 2022 20:14:20 +0800
From: "Xiaoke Wang" <xkernel.wang@foxmail.com>
To: gregkh <gregkh@linuxfoundation.org>
Cc: Larry.Finger <Larry.Finger@lwfinger.net>, 
	phil <phil@philpotter.co.uk>, 
	linux-staging <linux-staging@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] staging: r8188eu: fix a potential memory leak in _rtw_init_cmd_priv()
References: <tencent_FF6828BEC24B9560FE5D405E998D73633809@qq.com>, 
	<YkRCZXmFk7ElDGGl@kroah.com>
X-Priority: 3
X-GUID: E897C549-2026-4E8D-9CD6-B654FBE029C6
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.116[cn]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-OQ-MSGID: <2022033020141909119654@foxmail.com>
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

T24gV2VkLCAzMCBNYXIgMjAyMiAxOTo0Mzo0MCArMDgwMCwgZ3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmcgd3JvdGU6Cj4+ICBpZiAoIXBjbWRwcml2LT5yc3BfYWxsb2NhdGVkX2J1Zikgewo+PiAr
CWtmcmVlKHBjbWRwcml2LT5jbWRfYWxsb2NhdGVkX2J1Zik7Cj4+ICsJcGNtZHByaXYtPmNtZF9h
bGxvY2F0ZWRfYnVmID0gTlVMTDsKPj4gIHJlcyA9IF9GQUlMOwo+PiAgZ290byBleGl0OwoKPlNo
b3VsZG4ndCB0aGlzIGJlIGhhbmRsZWQgcHJvcGVybHkgaW4gdGhlIGV4aXQ6IHBvcnRpb24gaW5z
dGVhZD8KCkkgdGhpbmsgdGhpcyBpcyBvayBzaW5jZSB3ZSBkbyBub3QgbmVlZCB0byBmcmVlIGl0
IGluIG5vcm1hbCBleGl0LgpCdXQgaWYgeW91IGxpa2UgdGhhdCwgSSBjYW4gYWRkIGFuIGVyciBs
YWJlbCBhbmQgbW92ZSB0aGUgb3BlcmF0aW9ucwp0byB0aGVyZS4KT3IgbWF5YmUgd2UgY2FuIGRp
cmVjdGx5IHJldHVybiB0aGUgc3RhdHVzIHJhdGhlciB0aGFuIGNoYW5naW5nCmByZXNgIHNpbmNl
IHRoZXJlIGFyZSBvbmx5IHR3byBwb3NzaWJpbGl0aWVzLgoKUmVnYXJkcywKWGlhb2tlIFdhbmcK
CgoK

