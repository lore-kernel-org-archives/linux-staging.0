Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1268838BF95
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075467; cv=none; b=clJE/395orSSfPYgZmwvACFFL0O0xEYZEx5V9CIPHqgDQd1E8a8cT0e5YMraxsXnxyl8luEIOqoC82dOwidGs8LEpIL4K+FaaDU8ju4uQqO7CqMUyKn/r9UVtFybgyby8TdUzzGa/BNtPIY8P8bseD2JwkwDVKUCbSCkTtBvGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075467; c=relaxed/simple;
	bh=LKGT9cRM0JGEtXUxmPx51/TgjLEcrHG7/QLzbxAf+H8=;
	h=Subject:From:To:Date:Message-Id:Mime-Version:Cc; b=FRqQXAQz1sVc0ZeTiAHebMcwNP0/8/6sYolnA23P+mzHruG2/tf2xQYYJVQ+HD6vmIUL0ufxjxFSqjmNBxKxQCV/jhMZm7pOGim1N25GYzckxocztHz0xWUIYT2LJhUV/tvj/HXAUtI4wl0Den6KBhMP7e6CBDFvKwX0SsMcaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=D703JIeo; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="D703JIeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=u78ZaYFRYSsD/CWrxgJQSuLhjkXgA+79ryTmwDi41/o=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=D703JIeoeisXWfE1b2JkDdaRt8sqAjG7AmV1WwIrbh0ReB1CZkpvczrE7ALUlyjGsotyEfKvfOPg
        dKZTJd37xT+1BzzBb2NuJXzza8RD2wa/tmhwLiXX1e9wipEb2knkzhVOw+baQ54I75z2yiuqgDiw
        G7nV0dmTB6NN1pLjsIKxjY073tWeIV9eMWDDMG3k6Ld/zOIV15BXbkblfG3sw0VXcCA36Bl1rN78
        yV84L/95lhCrDdOdNvm7vvsb34qJqskmoNMn+OMhikwxVUdIJxIaxvEH8qR7XLvq/cnrlOBxjI+1
        VSws08UNDEZ2VdaE2EEbhD9Zi33LxFjJFEQ95Q==
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTE2NTcyOS4zMDYwMTctMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2Bfmd6LmQuc2VuZGVyLXNpYi5jb20%3D
Subject: [PATCH v2] staging: rtl8723bs: add missing blank line after declarations
Origin-messageId: <20260309165729.306017-1-me@dipeshchaudhary.in>
From: "Dipesh Chaudhary" <me@dipeshchaudhary.in>
To: <gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 16:57:29 +0000
X-sib-id: 8sIr8wbSSJOxvb02fAhIUpmsAcm3C2pz2IL4pKeC1eGLI0_wsiSJdMOvb7pF6Dz8B_6_adxM-Rk5Y3EuBZldupMtjEE4FPNjreLY-KZ9fPv2uy_0kIyLpkYCN6iAOeSK2bv1yt0ewWD7bY3PCtePXZn4CsMQye8YKm6HCMbU1WfPO-yjV37jJTlvhW4
Message-Id: <bebf2438-e067-419a-9d5f-b2323fefdf96@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Cc: <dan.carpenter@linaro.org>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Dipesh Chaudhary" <me@dipeshchaudhary.in>
Content-Transfer-Encoding: quoted-printable


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



