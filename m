Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35357E;
	Tue,  1 Nov 2022 11:14:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id d25so22678153lfb.7;
        Tue, 01 Nov 2022 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et0dLu8NcqFUEiFUqF09J+RIhc7UoMo0suIjCPp+COE=;
        b=Q2PtqRY6KrwP3n9DeLyFElWkTzB87jb7VOfbmqYF6zUGhNijk0IPeJ8TzNKBQuq1F9
         5UlQdtvRnaa6lhyLRHphzhkTQ1K4VjmL6NJ/taHrsvKQaZayYFmiA7YjS7DcTGup/8+v
         okq5l1ps1vTd1KP1wMYGMv43RfKXjWdelFUXgTHgg4WBQzpUVl7diPrXdtsH5zOKkK5i
         9n9WEcLn/LOyXmQafS0bqlKM59MMrRC5tizDeboWNSUN0nRFLZrgwifeVyHOg5L4xUZr
         GI9HWnPKEzUs0YTGLd7rR2jHQMx/vLjkg2+kDGjgzFvCqXi/JwmGgzf9kO8/Gypi9BZg
         PQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et0dLu8NcqFUEiFUqF09J+RIhc7UoMo0suIjCPp+COE=;
        b=BhgwHJZ40r58XQZVnIg04YJjgY/8uWAF8M4FWcXFpHvpGeMS6dSCot3ST0i0/fvmM/
         i25vSkv+kDlDkw6rSoEo5CMUJLX6q1zX6TSVspf2UQ7/b8hlpl13q8jZx/NzhWfzx5UT
         DJ1wvNmLiMQ1oGAio8fNDSwDEZxMTt7wAVtdH26hamphkIxwJ/W0we2vGuekilJinoat
         HvSj7Pzcl412/6zpttehS14lSPKgDlWpCujkFTClYLXFzt3HpuSTSiqBDW6LsIhaPQJZ
         XqgaXzVp/wuxbCFg1fYtGtW8vSKYkDmW1FqWBpXfRO1tEQQx1ts8gev4LPlNjQjywQDB
         3xQQ==
X-Gm-Message-State: ACrzQf2pgCsYxKfDIV42bi7ZzwtKlZC8WU6AKzwbH+gE6gfbh9FQti33
	q9KafZB3KC9bJuC3BWgyZAQTotiWRVfy6w==
X-Google-Smtp-Source: AMsMyM6aGUKbqF8nu2opQO8Hniz97PYjbfRKBgkjR7bJJweSp6d8uOuPN9u/iraFIINPAmdpG60aiA==
X-Received: by 2002:a19:ad03:0:b0:4a0:56ab:7148 with SMTP id t3-20020a19ad03000000b004a056ab7148mr7796171lfc.430.1667301287906;
        Tue, 01 Nov 2022 04:14:47 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id e17-20020a05651236d100b0048af3c090f8sm1629472lfs.13.2022.11.01.04.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 04:14:47 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 2/2] Join some lines of code to avoid a line ending in a (
Date: Tue,  1 Nov 2022 11:13:29 +0000
Message-Id: <1da74119d5a50ef97e68f26c82c9c9e429f8d0ec.1667300134.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667300134.git.tanjubrunostar0@gmail.com>
References: <cover.1667300134.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code line ends with a '(' which is not allowed in
Linux kernel coding. Joining the lines and indenting
correctly improves visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index d7e439cd8675..df7473155704 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -555,19 +555,15 @@ s_uFillDataHead(
 	return buf->duration;
 }
 
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pvRTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	struct ieee80211_hdr *hdr,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+static void fill_rts_head(struct vnt_private *pDevice,
+			  unsigned char byPktType,
+			  void *pvRTS,
+			  unsigned int cbFrameLength,
+			  bool bNeedAck,
+			  bool bDisCRC,
+			  struct ieee80211_hdr *hdr,
+			  unsigned short wCurrentRate,
+			  unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
-- 
2.34.1

