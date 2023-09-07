Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635EA29
	for <linux-staging@lists.linux.dev>; Thu,  7 Sep 2023 02:01:02 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68a3b66f350so440660b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Sep 2023 19:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694052061; x=1694656861; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vewNX7v9Jsogj+AcffyXezNkGsw817ei7jyYCtcy/M=;
        b=o1uQzhxBfnBYyc2k/nDi8G4rys0TU8egiSzFIQX1bIYOcvxrbKD5Vg5wgx4L9zA39Z
         78lSPjJ1p/ISwsAX7KWhxOwd7+Jdc6XlGjRG21dpswAwBnYFO1jgRMRzvN903AgvpAjM
         jr/kIgVXc4HZWxd3vH/gDO0i6gaCMKPQNxVvMoWSbuaViUJYuYiLTSetw5dN9oNQ+2KK
         MFXPDRmShtbQshGC+40ImWtiUWtP20BPKrlbigRHmHLboUubBG48qb4NUcJhhFUEHz5C
         5cbFsAiLBGpWbxJSY016pgt+myKWIz/edoDrFEtLtw+JNIqTJF5aveIPZ0XCb7SgDVRR
         nlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694052061; x=1694656861;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vewNX7v9Jsogj+AcffyXezNkGsw817ei7jyYCtcy/M=;
        b=iIjGCY02qI7LybrCFxCVwhOSUQQ3KB7W6DTLL9bW9CZWkLzOTNAKbVdf58HxlCYv7G
         AXM74TttBnNDYuOcWpG5+urQMNVIt4EYK9vOEq9hHgqLJ33rJ5Kcw6/H6Q3BfrKoW2h8
         8S91HXy+cE1eCD9WKt/euHdZiqlMcgDfeRSfTu9VT0VrNhYzwDuWgZZzp3MKVeWWoITX
         dvc8clukgKgp22eAf8WEmZ+zSB3zwFA36Rtrhst61ZqfKnapsO9+fz82ZskQ2YOJd07H
         Bj9mb3KAtrAJV7SCK9reVJAvO9GSbAPyv4ExJ8h5MD1OvNhCecFWZh3xUfeGjeGW+mmX
         NUFA==
X-Gm-Message-State: AOJu0YzEibhGORUYt2GKg7DoX8EJ75pmnFerAzbSCQBOxN04EDaA5K5b
	A2Gn0ux+Y6jUvhLYKsg7Yjs=
X-Google-Smtp-Source: AGHT+IHceUUoZG5LCctYCX8aJdipsimumNOe8uKkWOWovio35NejQo4+wc0xoeEkmmog5fgmMJGyog==
X-Received: by 2002:a05:6a21:71cb:b0:13e:e053:1050 with SMTP id ay11-20020a056a2171cb00b0013ee0531050mr19528449pzc.56.1694052061501;
        Wed, 06 Sep 2023 19:01:01 -0700 (PDT)
Received: from midnight ([2001:8003:6434:b000:c30f:d88d:412c:6e9a])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b0068c6889e146sm11685890pfb.98.2023.09.06.19.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 19:01:00 -0700 (PDT)
Date: Thu, 7 Sep 2023 12:00:57 +1000
From: Angus Gardner <angusg778@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: wlan-ng: Removed unnecessary parentheses in wlan-ng
 driver cfg80211.
Message-ID: <ZPku2UC5g99ILEI3@midnight>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Angus Gardner <angusg778@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 471bb310176f..d7d8a99adf52 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -351,8 +351,8 @@ static int prism2_scan(struct wiphy *wiphy,
 		msg2->bssindex.data = i;
 
 		result = p80211req_dorequest(wlandev, (u8 *)&msg2);
-		if ((result != 0) ||
-		    (msg2->resultcode.data != P80211ENUM_resultcode_success)) {
+		if (result != 0 ||
+		    msg2->resultcode.data != P80211ENUM_resultcode_success) {
 			break;
 		}
 
-- 
2.40.1

