Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE35F3A962B
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773061488; cv=none; b=SYCE6LYx7jCYt6FCYEdHdjsJeOPzSkmekM0CKyCUv6V8HthBHgf2BvEeQUI7WWo0C7akBBaP9o+SA9JAEQ5egRnLqXcNKaERu2K7mDOfLkJ0KLMqTAZg1Cj1nVHdB6Lg3rBIFstytMHi2qa3IMOfwkL2XkQxpifHVpLj4uFcALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773061488; c=relaxed/simple;
	bh=LKGT9cRM0JGEtXUxmPx51/TgjLEcrHG7/QLzbxAf+H8=;
	h=Date:Subject:From:To:Message-Id:Mime-Version:Cc; b=nXyckdZVRhguELS1Us9ikHPTgFXleyHJgqaU69HOfoL3geqHQtqLl3/e83ZQj998PhuJFiIvLpbeZqrtFsmMyVEdfjzxVT2R998p5AfphIXuGKkUTxLRXsXIcm4DVWmw9+S6+JDLKS2rkUl47T1ULzK6A0qU1wnw0MVTiutH5tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=gqDc6fut; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="gqDc6fut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=u78ZaYFRYSsD/CWrxgJQSuLhjkXgA+79ryTmwDi41/o=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=gqDc6fut5qc/f5m3cci9m9qh/vSHkU7+Wyuhd2QKI0ogvHmuKibeDuawrsxtWmCdDcN7ytkrPzEH
        v85CD6F7h+Mw3q54w3lgpDuNyIUfj4797+XSPlG7RxiJE1SKUd5mPCTzsdioo3ilLh4KNmBq5a7P
        zlip3D78wcVp2zZyRtBD2yOV5PvpGBN353QqSTjeAckW7KOMQLPw8COeHpT4D2pvzBiUPZ18MlPN
        C1Gs/52WUlGB6kBYAyaQCJb6qMECTGkCJr4ORRZo68SalP0X1kbXXVLfHmAzdK9i9ylW1+6ezPYI
        Axjs7TTPUsMpoNZ75PY3pBKlaSL68ZpXbEFcIQ==
Origin-messageId: <20260309130437.302741-1-me@dipeshchaudhary.in>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
Date: Mon,  9 Mar 2026 13:04:37 +0000
Subject: [PATCH] staging: rtl8723bs: add missing blank line after declarations
From: "Dipesh Chaudhary" <me@dipeshchaudhary.in>
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTEzMDQzNy4zMDI3NDEtMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2Bfmd6LmQuc2VuZGVyLXNpYi5jb20%3D
To: <gregkh@linuxfoundation.org>
X-sib-id: X_Y5e07aIKQYSrPTE9k-A3OghEWZodZaKEqMOVelRD0QfdAqbBmYlgI6f6OrOMvGjPL13jdtLVMWrkn3iflkoG9qiIqEHgkhT5aGrYHghG0U-SEMXDri1z099sv3mVhKRUUs_XOWwDz7V85iT4rAK7yL610iFFS6dWxyoWuYXzbeP9Gz8m_-brXC_ek
Message-Id: <d215ce3a-ddfe-43f0-8193-5890650d8c33@smtp-relay.sendinblue.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: <khushalchitturi@gmail.com>, <dan.carpenter@linaro.org>, <abrahamadekunle50@gmail.com>, <ethantidmore06@gmail.com>, <rfp2005@gmail.com>, <arthur.stupa@gmail.com>, <mingo@kernel.org>, <lizhuoheng@kylinos.cn>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Dipesh Chaudhary" <me@dipeshchaudhary.in>


Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
to satisfy checkpatch warnings and improve code readability.

Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging=
/rtl8723bs/core/rtw_pwrctrl.c
index 666e241704d9..bd295bdd73f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -991,6 +991,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv =3D adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time =3D jiffies + msecs_to_jiffies(ms);
 }
=20
--=20
2.47.3



