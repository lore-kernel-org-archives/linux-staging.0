Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72D17CA
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 03:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649217375;
	bh=aX2filfSFEj5vBMtD43q72C68TIjG2JpIiWef2rV3lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E28zaP7TQEUvBNeHb6QJmO473EclWSsICcw+wc9A9lnFZj7DaGqIvYaS/Jk/eruX9
	 P5Rle4I3eieJzPb5bW/Fshfx5ZBcKQ+g0lC9r/onVGlrapQVL76wQCu0CdlzsPn+h9
	 LIB7Glyi4Y+j9tyZlpcDEKermAe/fCEXZ5lFjwn0=
Received: from localhost.localdomain ([43.227.136.188])
	by newxmesmtplogicsvrszb6.qq.com (NewEsmtp) with SMTP
	id E0BA308F; Wed, 06 Apr 2022 11:56:11 +0800
X-QQ-mid: xmsmtpt1649217371t6o8amq8i
Message-ID: <tencent_E0622D1C5669EF1F14A49D79309788C39305@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiepNVBjjotu9W2eBdd7jHW6cnVnmELCYwwUMVgL2mQq4KY3VBBF9
	 cPKOuTXTDxEZsF4qixtfqd9rEqGIxhPQywikdo1p4zK6aW8JCRv+ghnaJEhSe/PDDBdyImyUo3g3
	 FF87RBCNPex5ZbFSb5xi0TK3l2qycu3ow3kjef/HYctRyL0yU7W5/fSK4etKefUvPihQIEGFlKFi
	 2p14ULeSHV9jaQpUeLkzVmr01trjuwIK5i6CsLncOQkzZHI16MOgDuH1l08Pau5znM8gyFdWWmg0
	 f670YqeoVG0UQBSLVq5YoEUOlUPj52EjiaAUtC9wsDHXLLDOpnoj7OptdXktgM6H2nue8Wc1uTF9
	 i4dB8vP6/2UReWMbeeCT2h1g1F6Id2mhNrFgmR8VqyV14fvOhtfxJw/wn94xk1m42WE2nhe0T/S+
	 trgqb6HmFX8xkk7Et2jiXzrsYPrkynH2NOHv0614OMJCRSMp7lfVPpNkkZJtTqIH55WWxzRVUp2w
	 ozu+2XzgsfmuByeHJ0/bg8kVCGqSjyorX26uxCgXvB98NqLjnKXcJb0Suq9Lk+hdQXsECgHS38vs
	 +qSwLoCMuYIZXBze1POIwHK2iVwfOatcK+0Cn2JxTfVhON3aEHkHvaYjx2nTojFTFrZC19w3Ym1t
	 EFJEHNd00nqemjycOlcr6YIkBsNpHRO/eSY90vJpRJ6Qb9Q3PASWxWQLMIPrflhqoheYN9oi8XZ/
	 zgX/QZy/rVlg0bbnlth66DlfNmY4X6sguXB92Ie0aa4I0Q/itvK7t5IBMCFz47aGY7gYVaEBjejS
	 KviUvRKsHj4HkZsSavxhwAS17BvEYnzqv9urAKrq5UROP/qtGBUrIuTF5VapbZ/yqQ4oo2WPw2C6
	 ZRqeDxBW/YSkS5zbNbREQuLup5b/Q1qF4e3pWaM9WoWDmC5hUZKwdS/4ACOWTpH9dO7vzwKxNX6Z
	 Igawm7xV55OswmFA9if6y8RogZZdQ5F1ReE3czHxY=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v3 3/3] staging: rtl8712: add two validation check in r8712_init_drv_sw()
Date: Wed,  6 Apr 2022 11:56:01 +0800
X-OQ-MSGID: <20220406035601.12934-1-xkernel.wang@foxmail.com>
In-Reply-To: <tencent_8289F062A5E3FF2C104466AF5C5A0E1B0A07@qq.com>
References: <tencent_8289F062A5E3FF2C104466AF5C5A0E1B0A07@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

_r8712_init_xmit_priv() or _r8712_init_recv_priv() returns -ENOMEM 
when some allocations inside it failed.
However, the caller, i.e., r8712_init_drv_sw(), does not properly 
validate their return status, which may lead to potential wrong memory  
access in the future.

Therefore, this patch adds two validation check for their return status  
and properly jump to the corresponding error hanlding code if failures 
happen.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 adjust the sequence of patches in this series.
v2->v3 update the description.
 drivers/staging/rtl8712/os_intfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 1f7ccec..0dbf8c2 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -308,8 +308,12 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	ret = r8712_init_mlme_priv(padapter);
 	if (ret)
 		goto free_evt_priv;
-	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
-	_r8712_init_recv_priv(&padapter->recvpriv, padapter);
+	ret = _r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
+	if (ret)
+		goto free_mlme_priv;
+	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
+	if (ret)
+		goto free_xmit_priv;
 	memset((unsigned char *)&padapter->securitypriv, 0,
 	       sizeof(struct security_priv));
 	timer_setup(&padapter->securitypriv.tkip_timer,
-- 
