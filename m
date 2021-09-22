Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535293FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t18so10519619wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TzGv9wYKIGtojpQmz9/kkZo6gxYvKQ+KisEz8eUqRLc=;
        b=DUVyhr6wKWjzocD9RJ9zqVyrxB6pSBMIdDWbWLFNTvKJmCdta0JYN9Pq17Q/axOqFn
         nzA3DyN3uVpu0FoOh51vSYQ9akDSVR+etf/qrMyWfzwl1bI3R67c8kStB93JjTxG14b+
         q804LxyDbbIhSB/mOIrEZQzfRV+b3qGedieo8gf41Agil+1hR2UhEmKj9wxmEB9YJI4F
         xLjwSvnOOLeIaVjhE8BEHds4OJKkSmmZitvJ4kKL3xdVH+qUFskOshzf6lsv+TYZQGCg
         BeCGuYGpReFVHL9tTCfKeMniCrtaHdFVrDJBehFN8G3q5NjQh85UnDf6KqP6vnVxAqZ8
         z0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TzGv9wYKIGtojpQmz9/kkZo6gxYvKQ+KisEz8eUqRLc=;
        b=LilMVk5k+zKOdwFldcvHx2r1Q6YySSQON1X5lfnnSmBYOu8YjdliIK4N4CJ1h1IH9Q
         NoklQ3e1NM0uv9tydGN78yRR7vTFa2n9LzZzbKUZkzuPVcu59eHvLETWtWFDS4M4SHLI
         6XGmC4/7M57V2fuWu89O5ECoflLFXqcbAbAS/wiKaccG2JcvQZc8kt/ErFQG0aOshewp
         jbIocM7paGoXv3YHXTu/cOtbRyn5yxZvasefwIwjEIGzYw1qg08dxGLsBYPnewtjFrDy
         lMM+qWretD5HlcoTLneJ/1aYf76acmklVcGazMFQhHv9JW3ANU0VY/NfYCeF5Vl1PgFR
         HumQ==
X-Gm-Message-State: AOAM533X7HH7QviW3Ba4qzdLqG2UyVb3m9Q4N/wA2T7UI/SERkEPlumc
	O24fIr+Gy+bM/wBtcSpS8ZI=
X-Google-Smtp-Source: ABdhPJzKhTnhgwJYoKjtssOTCKpzDCi6Bx44brJtqX/q7u/RbsSj5j/UszDg9S/1mAsRy879pqalng==
X-Received: by 2002:a5d:6750:: with SMTP id l16mr921494wrw.174.1632341146805;
        Wed, 22 Sep 2021 13:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 22/47] staging: r8188eu: remove rtw_set_scan_mode()
Date: Wed, 22 Sep 2021 22:03:55 +0200
Message-Id: <20210922200420.9693-23-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_set_scan_mode() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c    | 17 -----------------
 drivers/staging/r8188eu/include/rtw_ioctl_set.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 9fb6e07ae963..222c7f696279 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -529,23 +529,6 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 	return max_rate;
 }
 
-/*
-* rtw_set_scan_mode -
-* @adapter: pointer to struct adapter structure
-* @scan_mode:
-*
-* Return _SUCCESS or _FAIL
-*/
-int rtw_set_scan_mode(struct adapter *adapter, enum rt_scan_type scan_mode)
-{
-	if (scan_mode != SCAN_ACTIVE && scan_mode != SCAN_PASSIVE)
-		return _FAIL;
-
-	adapter->mlmepriv.scan_mode = scan_mode;
-
-	return _SUCCESS;
-}
-
 /*
 * rtw_set_channel_plan -
 * @adapter: pointer to struct adapter structure
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_set.h b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
index 2631c85773cd..32885d8e42ff 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl_set.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
@@ -21,7 +21,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *adapter,
 u8 rtw_set_802_11_ssid(struct adapter *adapt, struct ndis_802_11_ssid *ssid);
 u8 rtw_validate_ssid(struct ndis_802_11_ssid *ssid);
 u16 rtw_get_cur_max_rate(struct adapter *adapter);
-int rtw_set_scan_mode(struct adapter *adapter, enum rt_scan_type scan_mode);
 int rtw_set_channel_plan(struct adapter *adapter, u8 channel_plan);
 int rtw_change_ifname(struct adapter *padapter, const char *ifname);
 
-- 
2.33.0

