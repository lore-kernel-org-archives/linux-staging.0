Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB772
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 14:54:17 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id y12so13579726edo.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jw0xLY+vm795MhFxQkfoXv1/Mq5jVRjAqI9LMouhf/s=;
        b=NdaU2lIE2VdmHidOsEjh3ssUPR26yIq0ttRCxSLGiclMYfLL5X8V0IYDS7lo6Wiu1R
         IIh3pzZi3AwUogrfsWc9U05ZJLPTquzIpN2I9RU7o0rPg1Tq4Z97nFCK7qFf4UkPw6M1
         dmMFTsob/aTSK9mgQz/VRQVfQZmEBOGCNWm5GebqTJPzCCD5yOe40hl+9aXiXmE8m35d
         NqyKxl1oCPwv5Oj1Ji89UHXy7oi4WK1kOshF3EXAePfqCUcboSIjxpiAoPZe0vzTgSjs
         XwbPGe6mh8gq0rwSV3cIJ/b1aivNrniM8QOUYb+tuWlLHzl25+LYhxyvo1q1NKHtvsRO
         gMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jw0xLY+vm795MhFxQkfoXv1/Mq5jVRjAqI9LMouhf/s=;
        b=mrDstrFnF3tSuln8TGVUKJYbbggJ/dCH5Pumjgrxc2HZfOv4UaADdIUnnBjXIzmVoN
         YOtGJrgsJCyftbFE+c7kQU3dVyeP89QHTzgmZozbqOaTOF+IxE+xk465jwaadeAgG+uT
         e54QJs11jtR321uQbt8GnZOlZHr95/cjJ6xS93oCI0Fi5jldkWHLLrXJFmPKlglw/76J
         JLLj2vVhcSYTMwaI9lE5VFdWFCSAJ3zaQoi27qKlf1oVSJxVXlKJjEn9xhR06oziezTu
         JpAhBjb4bl5XAgfdxvg+YwqKayWDGGc7mIAFP05T/HNp+ojgrSXGZ4RxF2uzlN+p6wHh
         BLCA==
X-Gm-Message-State: AOAM533lkZ5hl8ZtSJJt4ws8JlEAJEhav7U/0NWDhL/rP/u5sqfWuST6
	RlQHhXmRZQX6ALvCgO6FJAs=
X-Google-Smtp-Source: ABdhPJwKFHy5TdGafmcw5J/0qFZuSmaO6yyDBNHHM8pE0s/Ni2+FENJD00zajqvnc1vdo41KVVSUUA==
X-Received: by 2002:a50:f1d8:: with SMTP id y24mr3373123edl.275.1627656856089;
        Fri, 30 Jul 2021 07:54:16 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id o7sm616292ejy.48.2021.07.30.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:54:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8723bs: put condition parentheses at the end of a line
Date: Fri, 30 Jul 2021 16:54:08 +0200
Message-Id: <295a41c98cd475ae25f9288d99a929b75492db3f.1627656773.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1627656773.git.fabioaiuto83@gmail.com>
References: <cover.1627656773.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

put the closing parenthese at the end of a line

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d3d068babb5e..5ed13bf765d2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -606,8 +606,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 		/*  probe resp(3) > beacon(1) > probe req(2) */
 		if (target->reserved[0] != 2 &&
-		    target->reserved[0] >= pnetwork->network.reserved[0]
-			) {
+		    target->reserved[0] >= pnetwork->network.reserved[0]) {
 			update_ie = true;
 		} else {
 			update_ie = false;
-- 
2.20.1

