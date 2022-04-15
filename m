Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A7415AB;
	Fri, 15 Apr 2022 02:48:49 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id y19so5755466qvk.5;
        Thu, 14 Apr 2022 19:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5A0iA12DjE2Xj3oy9Ql9XeQvXRDjoLwHOA0RLzS8BtA=;
        b=Kt3n3LeBcKw1ZOw7sJPczy6niRGgP1zaVmb1h2ZKFd7Trl5hILhNxeAwpliosVYxfB
         rX9hRaoJWi/By5k1bWGtDyL9Wa4Skl6p/qG9S5EsZst4JfDiS+ENNJoADRE7L5sRUQcm
         8ncR+ehvbPsk3Jr8mQCrj+/zDjwtr4j5ADKT+B5VrFwKzCi9Tjapju8cpyjW1kaVMfSO
         53OwU8UazEpaA+zZXOmiV5EJu0AUWx49LNhxdt/H3HAuJtFXWCyv6uPMyowmltlv1dTF
         p2FencsA92C2GO5NPWZkCMijo4xCeDeaK1sas8n43uU8PjbMgA32ETBWrko8oPtmSZ7B
         E5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5A0iA12DjE2Xj3oy9Ql9XeQvXRDjoLwHOA0RLzS8BtA=;
        b=dLjsnWaVdImFMMFfFWDD6ZpAXmrWA5VT5U1Gxw/DebvSM0GS7oZQhPnz5y7qNnSYiY
         Bc+dZLSzOwIqPJXlYvXMYSiPUtp1RqWuw7mcPr59nv+614C3ueXDP/EkeY494/COlJol
         sV64XkiTRpy+IbTQzpXwb0kHiKqD+vKcDEXt1yhBxgrZ1HW55IsRIBqut0Bts0DZWyIa
         way98zR66DAvEQ5w0R+ubExbjEUpnwsl55nFobpRBAoTUC58YY0fgePDuCi+VpBVP+Pb
         gjCvZ7XG9L8SmXTUpzbqvPKwtCq/hCrSgdfkhdQ+QQwn9uDhlS0dfIupfMYfjZA2DX40
         g7Qg==
X-Gm-Message-State: AOAM533TR0cBEytmlY52yldr2HOqLZQvv3XB4tTztTV8AE78pjAkDqYk
	QFJm5ZK3SyyHwpxIA4uh4oA=
X-Google-Smtp-Source: ABdhPJz1dzwq53DhHYwCxThDEjWcaTnzYPO2a0RsEGbxEj+H71G9rhqjxIqxyJwnTkp1ohzCNfJzPw==
X-Received: by 2002:ad4:5dc9:0:b0:443:b9e9:31ee with SMTP id m9-20020ad45dc9000000b00443b9e931eemr6088842qvh.111.1649990928205;
        Thu, 14 Apr 2022 19:48:48 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:1b7a:2349:50b1:5db4:a2d5:7054])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a22a700b0069c37e2c473sm1800085qkh.94.2022.04.14.19.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 19:48:47 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Pavel Skripkin <paskripkin@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v2 3/6] staging: r8188eu: remove 'added by' author comments
Date: Thu, 14 Apr 2022 22:48:34 -0400
Message-Id: <c0eaa7cbc61d89967d81ef864c1a791f4adb1978.1649990500.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649990500.git.jhpark1013@gmail.com>
References: <cover.1649990500.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Author comments "Added by Albert" and "Added by Annie" are sprinkled
through the file. These comments are not useful and can be removed.

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
Suggested-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 1620ca181bf7..bb9d595a90b9 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -903,7 +903,6 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
 			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
-		/*	Commented by Albert 2012/07/21 */
 		/*	When doing the WPS, the wps_ie_len won't equal to 0 */
 		/*	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
 		if (padapter->securitypriv.wps_ie_len != 0) {
@@ -1622,9 +1621,6 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/*  */
-/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */
-/*  Added by Annie, 2006-05-07. */
 /*  */
 /*  Search by BSSID, */
 /*  Return Value: */
-- 
2.25.1

