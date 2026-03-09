Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25D2BE7C6
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078558; cv=none; b=n8IOv4l++HaU9IBmauQBBEIhYh5M5ZJrQwzylUOH6D9J/LtGzF8O+7YToaFicZQ0P29B7OZqSqPiiE491ziVfZ2tM3h0SlFVXjOr86ng5F10Cwt6XrZ3IADqdwZcuq7Fj2g0a+XuxiPP1kViX32ESgKq44BS5dxxc9sQWNjrtK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078558; c=relaxed/simple;
	bh=0aGklt2xZL86VqRCrJPoRmeLeM3YTnZgxzEVXoEPIQA=;
	h=To:Date:Subject:From:Message-Id:Cc:Mime-Version; b=l3AKZaY8RNL4TLGCymDFQOV38CdTsvCmVaHifVWU8M+5ZtH1G8tnjhp713XSN9tMq8GRyuYerQVxslUP/opQN9/rmsgsa0D6PXrXBAHr9Xj1KiaieqVZXVRA3m8N641oIuA1XGtNIWs6hYstb2ARO3YrSsnj6CUQsYxr5eR7k3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=lZ0N2EMK; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="lZ0N2EMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=AuA5knd591kIzyVjY2XNDar1DO7SdVWbRthSXu0SB4Y=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=lZ0N2EMKh4I8MO6x3tGLLf62wQsnYC+pTT4Rjr/yXrmBGN7jlZ8zepEY/lfKNo4wOrJkRkly2Zjj
        742U+MO917jiiMnNnoP7bFkLZMMx0pVUCOP9minXIvJ/0t3GXDY7XWYqX9RyiiWMtyXbyuizya8P
        O0zY5TqU8EYNEowvCHQhdZbhZAAaMcxvqJL6DlSbTJr0/UOmucdXsKiLvoUcennWT6SMVdQRfYOT
        GeEZQXS67shj7h8qG1h8Y1jnJXkqOuCTsgvujS1qzhs8TRW3zm8hrSYP6NbQp6BPsaA6Ba64Z+CN
        hHdXAYFLuvB+bFqjxr/qEz3gN159W8DOSjH8VA==
To: <gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 17:49:04 +0000
Subject: [PATCH v3] staging: rtl8723bs: add missing blank line after declarations
Origin-messageId: <20260309174904.306678-1-me@dipeshchaudhary.in>
From: "Dipesh Chaudhary" <me@dipeshchaudhary.in>
X-CSA-Complaints: csa-complaints@eco.de
X-sib-id: svPsYx7qpSdk5Gw0twCp8hsOH9QSNSYJvYIsNXouh-QyDZ7lZ7duD7pXysnPkst0JAo0TNuP1u2OZaDpV-Ek5rRUpup6JY8C8ZHWzQBW2DKGRA82Q8DXrHIizNPRnnaWqFcYpH9Ri2uoVFYVslJmCUTMshrzA5it2c51DUwriU-tTXawsCCwRKrZb1k
Message-Id: <c34f031c-3271-47cc-9a06-fc3406a25aac@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTE3NDkwNC4zMDY2NzgtMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2Bfmd6LmQuc2VuZGVyLXNpYi5jb20%3D
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Cc: <dan.carpenter@linaro.org>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Dipesh Chaudhary" <me@dipeshchaudhary.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0


Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
to satisfy checkpatch warnings and improve code readability.

Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
---
v3:
 - Corrected the changelog location to be below the --- line.
v2:
 - Capitalized name in Signed-off-by.
 - Wrapped commit description to 72 characters.
 - Fixed duplicate submission issues.

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



