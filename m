Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94CA3FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t7so10281388wrw.13
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7MLnZJk2isCWixXXkijY4/cOaAJz5+j1fFIjVjMna1I=;
        b=TKkYRnbuV+72VhEc7in/klbAK1YrQIS1Ze5fSarViK4InAqKsxxeINtNeU3JkkxjD3
         iXIGBugzyldqjtIGLpunzF7pD3glRjIzM+MJ/BU/0uv2SOWfibuOtVOSW5LEuQVN4M2J
         1FoDCAgc5qsTEK/uFMp8VglzNnSJ9/xS4ip9iy9qxi7rOLj0gOyqyRM47mVyqjHx65Lt
         sSV0aTe9CZGgEKJQy2qQCteUYZvAIZcBVMPHv02YWjuR9dwryhcjpjukUKzQ7xmj3FTo
         STgOQ+xerON4PU77efJTrCb7RTN/e2AJw+kibAYWxfplGqJNnKewlqqfU3T+wBjaxvWQ
         KpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7MLnZJk2isCWixXXkijY4/cOaAJz5+j1fFIjVjMna1I=;
        b=QSt4efpouqkEVaAB8+axRqy5uvSJenkeFv1omRT35lVDTEq6kYT31ewKcu0Ic5m431
         oeyyu2tpR7C0AcBRprWH3gXR8B4MKpybxd1aY1MXxTpuAfsVU1vIZkgLV331Hjecsof0
         pA87PLFey0iBDaIJ/o/VPxV/tj7lg82fhev0GEkkHJfjAo1O7por9MoytUN4jDzMRJgX
         QgsaLkcgAP7Jjlit8Rovl8CmmHIk9T8rD8DdFH9jANvbQiUI0vYs5TgW8wnjr1gb4U+L
         erHC9RDHqNZlKGuX0I4d+/aOYhJ7588WofJGXom+2iqdXS/29WkrhOqW3X0IGJ8vu+/g
         d7wg==
X-Gm-Message-State: AOAM530lxCB2iXg4XtmQ4xlQU8dUho4gkVgXIdXTF6mWkzhPVQxXYaHi
	dvypOHMaZAknqFNxvIKHXuo=
X-Google-Smtp-Source: ABdhPJy9Nbc7xF5KzsPelwxdY1Imanco8trUUHTb6vsqviVerlZywKYOllHuj6nADanVg3H2QPmCvA==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr885120wma.10.1632341148221;
        Wed, 22 Sep 2021 13:05:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 24/47] staging: r8188eu: remove rtw_set_channel_plan()
Date: Wed, 22 Sep 2021 22:03:57 +0200
Message-Id: <20210922200420.9693-25-straube.linux@gmail.com>
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

Function rtw_set_channel_plan() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c    | 13 -------------
 drivers/staging/r8188eu/include/rtw_ioctl_set.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 62ab7fbdcee0..21ba2873919d 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -505,16 +505,3 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 
 	return max_rate;
 }
-
-/*
-* rtw_set_channel_plan -
-* @adapter: pointer to struct adapter structure
-* @channel_plan:
-*
-* Return _SUCCESS or _FAIL
-*/
-int rtw_set_channel_plan(struct adapter *adapter, u8 channel_plan)
-{
-	/* handle by cmd_thread to sync with scan operation */
-	return rtw_set_chplan_cmd(adapter, channel_plan, 1);
-}
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_set.h b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
index d84ae57494e7..7365079c704f 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl_set.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
@@ -20,7 +20,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *adapter,
 				      enum ndis_802_11_network_infra type);
 u8 rtw_set_802_11_ssid(struct adapter *adapt, struct ndis_802_11_ssid *ssid);
 u16 rtw_get_cur_max_rate(struct adapter *adapter);
-int rtw_set_channel_plan(struct adapter *adapter, u8 channel_plan);
 int rtw_change_ifname(struct adapter *padapter, const char *ifname);
 
 #endif
-- 
2.33.0

