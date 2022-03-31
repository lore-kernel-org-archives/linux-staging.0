Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA2A2D
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648746554;
	bh=ctWsvOCYw/Nk+/HVUYkGj4y3NFwJ5+znyibIFc9hryU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QLp32bsgpMqHi6NHe2kspE2aYEOMVfhmZ9Q9EqIUOVuyf/eZW9W03gUHdsx6QH8Ac
	 nlBiV/biUNuGp/8gVW9StpusRpkmhIPWWGLpQyYFV5BiQQUjthROD+FGuoQviMxaGE
	 hq7mU2MRf2iL5QAlPFDESO8Vqdj9iu84a0KUjSP0=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
	id 2031D0A9; Fri, 01 Apr 2022 01:08:03 +0800
X-QQ-mid: xmsmtpt1648746483t4hkxdb1g
Message-ID: <tencent_3096E1464A73FF232014CC40B9001C551408@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIeMjOTVeXWC6Xr2HPJXf7Z1mIOravcX95UqAVizHoxIBVt3O1iMe
	 N+brrEucwxY9JjJAODjkJFI2Ml5/p7bi/oxa+K7Njk2I7SjR/CBb97B4tObAqxiMN9W8hyv9mDQL
	 SaBR1OILkXRb61xxFb73V7qPPVZITz4WCzXWnczl55vcknJ5DOJJmoy93s0VjORlIEoMA/MKymrL
	 gK1TZK4/RxMammsgvUERL8oR0vsJMN2wvfnu5MoLMDd06g0L6fIy/SX4uCSjEtv2pAdyoHEKk5+9
	 qbZHCYxaA/4XGHsMV2iyf1HOyt/WfWPaChRpNhO2CtVdB96AwVSJZr/x5fTOrDDKTxWwjL6VyqHE
	 qn28YT3AF4LFLWIQn8oINPt2eFTlUuhWInd24baVuxV+EUsBYGHcvQXK6NhX1x9VYpkfLuktt19k
	 LYKnrVcren0gtJYn3fe7cV27BZa605XX44MwDPhZibDNu7b99GdaMZRw5jrVvg1HRl2i9rlGqLfP
	 sNDFuqLI9Cy5WR4QO9/FjZLoU3DzPjlt3BP0Fu7yxrULuSLkh8CIVq9ikvOQeNbvvT71Xty2lH0b
	 lOk0Gp7cvUmQdyT/w9RSxBqtyPVtHL3Za58Wc803JA2t9YiZb0E+ZH0KlT+gc5bnjbVabN2DFKYr
	 IRK0Ad3Ll0Li9BDj2rhnCUTki7TcCPiH1npuH0NJKblHC9xl2S78af7VhQ1L7N0vs0JEMDkWTJeE
	 yaqo57re1eebFjxnOJAIatYpTstHZeY79ype4MzIsvgGGkki/r7qiqqRdT+eZ9ezExyHldxgfw4y
	 m6dCXmB5GKpAD6GfK8qDxqScbruxPDahim24iANlzPinT9R7PmIRxh2BItXhEX6EAGv3z38+1DaB
	 uo+WG/l+pmYN12/prFD7sqBXBL+hhY5PUVSdzmk0gZM8ANrhV9lDMWef86Wutsam7731RcWflaFg
	 XMLD30Tk4=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 2/3] staging: rtl8712: add two validation check in r8712_init_drv_sw()
Date: Fri,  1 Apr 2022 01:07:45 +0800
X-OQ-MSGID: <20220331170745.9592-1-xkernel.wang@foxmail.com>
In-Reply-To: <tencent_0A1273526E1E87150578F8B752CF7F178806@qq.com>
References: <tencent_0A1273526E1E87150578F8B752CF7F178806@qq.com>
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
So it is better to check the return status of them.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 9502f6a..163baaa 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -308,8 +308,12 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	ret = r8712_init_mlme_priv(padapter);
 	if (ret)
 		return ret;
-	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
-	_r8712_init_recv_priv(&padapter->recvpriv, padapter);
+	ret = _r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
+	if (ret)
+		return ret;
+	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
+	if (ret)
+		return ret;
 	memset((unsigned char *)&padapter->securitypriv, 0,
 	       sizeof(struct security_priv));
 	timer_setup(&padapter->securitypriv.tkip_timer,
-- 
