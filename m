Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C807421D596
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 23:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653982; cv=none; b=hV01lSE22htCagMeW4gOfHfenkJysXZ6zoioo5BSqO4QWDtuiAWQjM2BXIvpy6FbVr7gpHIzruYcUheQ2vIOKJ2yCNxZiy3InjUtTjwbVuXZvH090lGBl5RB9pspb1U10/B31i8Sfr+bRrza82cM7JSFoMNtDlgYyk8cAPvZ/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653982; c=relaxed/simple;
	bh=ZdPlkL2fyLTXzJe6AczWhp6+4Uqn+Byg/9vH9FfYgIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a2UHQuTqtf/QLZKNjgrsJMQbrMJKxim9SDCu7WNfrpwdOuoKHW7f8OXBz4xDkOac/zo+tOeEOeMIHy+HWgeSkAwh9+KGkwTau+fyoqT1svHMqJmWFkEmuJD+d+zD/XXsITwzTKV8gDQb2u/rqrCDPbSdk3b0ELIGIpeTtYF46IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNjGQD1W; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNjGQD1W"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-30b6dad2382so5568211eec.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 16:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781653980; x=1782258780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x//OojVdvKsF1B5rqWRkEUus6sx/pFFpIK+ZoZjUJyQ=;
        b=bNjGQD1WH25xvnvqrl97+R2lxiSdrVOWpaGACOkoOI7ybCt+E68f8LjyoQ3EGbVDmv
         uPk6mONO6LozYZX1O4jX3FslWmHudelokWIv7/4kY3TlGVvvYuW9l/GlakZLEfMjyx5D
         KYL8ynNmGYBQdE8zNLWgPnTloAGb/ypMfSTg20yi3zuJbyTCXqWBUjkINgIo0lF3KGVZ
         P7VlZNfU+q1zr+9skt+HNxyWcISANjh4Ay8Unln5Jj26ESHf96GzcshQskiRBut2DzhX
         ifbq2bmTL+i3ArqU/MMJQ2l0KGf0bGPQWA1P3E1qF7L0HngKb0TK6FiMs+5ROhwkwasY
         PLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653980; x=1782258780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x//OojVdvKsF1B5rqWRkEUus6sx/pFFpIK+ZoZjUJyQ=;
        b=OFbllh2cvyyQz7dAaWPdvmst8B5gz0wwK13xZVk88GQh0Fwv+sDkFQUid1iYPEXALB
         fSvP8BoU/AvdzjMlKVP9h2xmIXjJ7OuylhAaPNZgE3PC5jwQnybK9N8SZAW4zZ7/Z6Uv
         4xECU+F0uknQGOjPjT6QgKjWS+fIaS9IpNqxz2D58dORxecEsuxzhjpwjq/AemzLaLQX
         0oqkgMBUj/mo/QBky2w/QuxfosZFIefi+QYGB/b3Q7DsFhmtshDe6nhGMSeg9BVs2GTg
         3g75b8oQ7kOLdjY5CNsGjnjIksg5S+ZKdQ0iQtZNuNQDf8B0Hn+z6IowkhOsSW+TQ7Ku
         Pxsg==
X-Forwarded-Encrypted: i=1; AFNElJ9TUK1BqJgOZGQO7bzfeuR3yXxO8BSfHXIlk8P/hfIlH7EbShKcAoRMj8uUzrYsGSMpn3c3JGJvW+6x034j@lists.linux.dev
X-Gm-Message-State: AOJu0YwhZYSdTZWqnvY7BZ98GCILpC1V4hDz55lUUFVqhInAm+hW5FlR
	TJL4sD9Hq+AMt8c5iiQNYPx/F1EtNSmOhjNBt3T+qClcEOeK7jAr1Lnj
X-Gm-Gg: AfdE7cnr/nVvZ4NlrOrZsvuVqs9sJl20ftA3jFlv+R78U7MyoB7El55//EvkVJvIJiX
	uSOPlMMWmy6XAgNoXVCI8YAHiD1m8A6HX78dwAZgOuenMNPX68NnOTUkOSYmpvp3S0AMCG/3SjD
	wI9BFtQK9H/5q35AJtIX6Ek7Id7f8QZbFCGgWfZ4dd4DG1oNp/VcSR70buJQl0qQKgyWnSyEZ9D
	vI8azIfHHwnrYRg2stBvI7rJTJ5dTk793+reVGMaQjbGq3TZnWpMM+M927RrBQDqXM6VX3hHNUM
	tGensFvQCdpeC67NvnCJbkr4HGnuEeOOOJ6NMDUPTiyudOzhmk4FwgTMmQN3FT3x2QAsTZFqy8E
	rXcuqwy3l45IzFZqucg9jzAhfxDcU4x+JF7bH22aNqUnO/44OEpS8FlJxpsSP4yMFX1SE8RQx+s
	U7TRfRF/m7asQzok/hbaef+ZBlPK8mPVmeyDyh1xn1IzDDCKnbMLearxI=
X-Received: by 2002:a05:7301:6742:b0:304:e6f8:7cc9 with SMTP id 5a478bee46e88-30bcae0434fmr839165eec.20.1781653980083;
        Tue, 16 Jun 2026 16:53:00 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d3f20sm20208153eec.9.2026.06.16.16.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:52:59 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 2/4] staging: rtl8723bs: simplify update_attrib control flow
Date: Tue, 16 Jun 2026 23:52:39 +0000
Message-Id: <20260616235241.99076-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616235241.99076-1-dennylin0707@gmail.com>
References: <20260616235241.99076-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace goto-based error handling with direct returns and
remove the temporary res variable.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 6ab91de472b0..69b6d3a2554a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -664,7 +664,6 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
-	signed int res = _SUCCESS;
 	int ret;
 
 	_rtw_open_pktfile(pkt, &pktfile);
@@ -741,19 +740,15 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		psta = rtw_get_bcmc_stainfo(padapter);
 	} else {
 		psta = rtw_get_stainfo(pstapriv, pattrib->ra);
-		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
-			res = _FAIL;
-			goto exit;
-		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED)) {
-			res = _FAIL;
-			goto exit;
-		}
+		if (!psta)	/*  if we cannot get psta => drop the pkt */
+			return _FAIL;
+		else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED))
+			return _FAIL;
 	}
 
 	if (!psta) {
 		/*  if we cannot get psta => drop the pkt */
-		res = _FAIL;
-		goto exit;
+		return _FAIL;
 	}
 
 	if (!(psta->state & _FW_LINKED))
@@ -762,8 +757,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	spin_lock_bh(&psta->lock);
 	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
 		spin_unlock_bh(&psta->lock);
-		res = _FAIL;
-		goto exit;
+		return _FAIL;
 	}
 
 	update_attrib_phy_info(padapter, pattrib, psta);
@@ -799,9 +793,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	}
 
 	/* pattrib->priority = 5; force to used VI queue, for testing */
-
-exit:
-	return res;
+	return _SUCCESS;
 }
 
 static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
-- 
2.34.1

