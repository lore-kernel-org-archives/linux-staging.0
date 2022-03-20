Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3292F46
	for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 16:36:41 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id b8so11215527pjb.4
        for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bI1aV/T6nFEhtOyenRyACVUUEM6b85bDSzIe2Z/lFU0=;
        b=on7cPFya9d/dSBZogWdWGjtvVx/Y5BKpiUOVTU7H3yZPALEFJi/MNI8YIJJucJ02RN
         wLwU2cAsGyyJsVR79j/1mp4TQnI4bA/0X4T2JXMBd+4v1ete+6oJGEcscws6OuWyAONK
         MP+mF94W6cI974MtMJ/AXBJ6+njJK6c4oaQMAY7E96H16SWq5iC5RvyIHXEO90JOav2l
         rJe1FLfoqmSgS1kAoN3EZg28fdzWT3151GASm+w8uxlHS+wF/EivtHNnJe2I8s2hRYqd
         htWpb+crIW5uCMIQg0bJxjifC75xwleEHDXFav/LLaGYMLEadxADpaJfNURl7uh0nBI+
         XYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bI1aV/T6nFEhtOyenRyACVUUEM6b85bDSzIe2Z/lFU0=;
        b=DdTgwNAG0vueLbJwrWCi02ncCknsoSiKivxo2KnvKEO0HgkzzKq+OEe009mBIZSrB3
         RE3eDTA5g1onE2HXGHGVMFB5ExU89cCaeTRt1hz5Kmnnnwf9/nAhDRJUBDho2D+VtGJc
         55XHhLzMCoXDbuy5vEZi0b1VsJDNZVZSGc5aiVb05EQsz2XkVAz6iic2mLZYnWgw+Puw
         Pupti3zqiYfu1fN8V/AAIofJpLGXFRUpUrtY8NXgBcofF1kCU7zkQiovGZrjdXr7X3vF
         OqcBkSBx77HDf/XczUmEywe6WFWyVtohhEF65ajCU/Rv0hdtBMvVbWGLfIbEwIzyZQh0
         nvMQ==
X-Gm-Message-State: AOAM530dh898axuYK1LHe0EDElCPwogeKpJuo4n3yqtSX3Bt9zgkffIL
	pRlDitueB44i+vrZss9IEOk=
X-Google-Smtp-Source: ABdhPJx6YTBQ44jFi3LMdVzy6vwsfZ1cZntwOQ0JbybZ3erDBU54Y0Gzukw6zOpOrm8tOv0A9+w4NQ==
X-Received: by 2002:a17:90b:4f43:b0:1bf:5a2a:598d with SMTP id pj3-20020a17090b4f4300b001bf5a2a598dmr32261971pjb.160.1647794201326;
        Sun, 20 Mar 2022 09:36:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:4000:2381:95dc:514b:b97f:b05c:6ff1])
        by smtp.gmail.com with ESMTPSA id z6-20020a17090a8b8600b001c70c8e4040sm1485535pjn.27.2022.03.20.09.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 09:36:40 -0700 (PDT)
From: Husni Faiz <ahamedhusni73@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Husni Faiz <ahamedhusni73@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: av7110: fix switch indentation
Date: Sun, 20 Mar 2022 22:06:17 +0530
Message-Id: <20220320163618.41054-1-ahamedhusni73@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225155622.585621-1-ahamedhusni73@gmail.com>
References: <20220225155622.585621-1-ahamedhusni73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes "switch and case should be at the same indent"
checkpatch error.

Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
---
V1->V2: Add a clear subject line to the patch.

 drivers/staging/media/av7110/av7110_av.c | 30 ++++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 91f4866c7e59..1d42862e9669 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -770,22 +770,22 @@ static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
 	if (length > 3 &&
 	     buf[0] == 0x00 && buf[1] == 0x00 && buf[2] == 0x01)
 		switch (buf[3]) {
-			case PROG_STREAM_MAP:
-			case PRIVATE_STREAM2:
-			case PROG_STREAM_DIR:
-			case ECM_STREAM     :
-			case EMM_STREAM     :
-			case PADDING_STREAM :
-			case DSM_CC_STREAM  :
-			case ISO13522_STREAM:
-			case PRIVATE_STREAM1:
-			case AUDIO_STREAM_S ... AUDIO_STREAM_E:
-			case VIDEO_STREAM_S ... VIDEO_STREAM_E:
-				pes_start = 1;
-				break;
+		case PROG_STREAM_MAP:
+		case PRIVATE_STREAM2:
+		case PROG_STREAM_DIR:
+		case ECM_STREAM     :
+		case EMM_STREAM     :
+		case PADDING_STREAM :
+		case DSM_CC_STREAM  :
+		case ISO13522_STREAM:
+		case PRIVATE_STREAM1:
+		case AUDIO_STREAM_S ... AUDIO_STREAM_E:
+		case VIDEO_STREAM_S ... VIDEO_STREAM_E:
+			pes_start = 1;
+			break;
 
-			default:
-				break;
+		default:
+			break;
 		}
 
 	while (c < length) {
-- 
2.25.1

