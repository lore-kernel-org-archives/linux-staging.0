Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0510E2F46
	for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 16:37:08 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id s11so13569986pfu.13
        for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l5y2O5eH0uz4RqUV+g+CVqKPa9GF0DiPMGgxFfF92Z4=;
        b=WfTrmjxf6qB8DHA3S1LUOhT3UuO407oKcxOU285vY5JhyTe5mLiJK1Z75xSrTY8CER
         JyjuInZj4nuM7Eaxw/BsXtyM11Vz02oZ2mtmWLC/g5rJNtAxxjJCpBx/J0V3yFnH8HbM
         MgmYsxWBylHhozkp8m8ilMWGB7Aimzc7hGoKxP0fDd8+0NWFx8ncEW7X0oJ8fjeAATlr
         jJB6BKc1HdLgEvFdvMSrGXGG/s6zxWJFAggqz4AmILV9pgNERgy8FqQtYkfkZt5JLmeD
         4sitkdPh9tLhNbBQDZjlwd/DuoaaGqZ5XR7hDxHEr8wCRLAp6/JrEeSHb+eqE2F6su40
         BxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l5y2O5eH0uz4RqUV+g+CVqKPa9GF0DiPMGgxFfF92Z4=;
        b=G00q2MpMq8tlshlPlDXKDzJWat1fFco1XhM/8PenWTYt6U4NDfS4sAvwgMxhT6vMdv
         UbsbktYYY/nAaQ6/P3RDFT2SSV9zQbIsQaZlYYNJBf8CXm0qInnuz0fI43QvJTcNTA3E
         QEkKGlfZhcyQXGexcGxWSPehGGT06IAAvhZdoqq99n01x7JkOiuK0GwctZgwNwMph1O0
         sIWyXkbMglYGjQdfJO8UKd+DyiET2HMG38ieRnaPU0XHe80rAH+0QOxVheaqk+z7cTzQ
         QBOEVvTLrMuPmVKi5UFnXPXl2EOLK2P60zNDiweZwNHvOGb0JUKFWFpUJQlYCsIjCHO4
         92wQ==
X-Gm-Message-State: AOAM530L6f+sTKaS68H0GX8Ka9hhq5g/yn32S71XfRb4MfSfIaKoiUhS
	aN0fLSY4PFSgOGYN+vrocDo=
X-Google-Smtp-Source: ABdhPJzgb2p1evISFTPaTJWiw1LjEItmF2jn/t0+UOhObYSZsu+WojxuIlFa2+I93NUrw7R5XeAfHw==
X-Received: by 2002:a65:614e:0:b0:380:bfd9:d4ea with SMTP id o14-20020a65614e000000b00380bfd9d4eamr15080781pgv.92.1647794228474;
        Sun, 20 Mar 2022 09:37:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:4000:2381:95dc:514b:b97f:b05c:6ff1])
        by smtp.gmail.com with ESMTPSA id z6-20020a17090a8b8600b001c70c8e4040sm1485535pjn.27.2022.03.20.09.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 09:37:08 -0700 (PDT)
From: Husni Faiz <ahamedhusni73@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Husni Faiz <ahamedhusni73@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2 2/2] media: av7110: fix prohibited spaces in switch statement
Date: Sun, 20 Mar 2022 22:06:18 +0530
Message-Id: <20220320163618.41054-2-ahamedhusni73@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320163618.41054-1-ahamedhusni73@gmail.com>
References: <20220225155622.585621-1-ahamedhusni73@gmail.com>
 <20220320163618.41054-1-ahamedhusni73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes "space prohibited before that ':'" checkpatch error
in the switch statements.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
---
V1->V2: Prohibited space fix after patch review.

 drivers/staging/media/av7110/av7110_av.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 1d42862e9669..ab7cf496b454 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -595,10 +595,10 @@ static int find_pes_header(u8 const *buf, long int length, int *frags)
 			case PROG_STREAM_MAP:
 			case PRIVATE_STREAM2:
 			case PROG_STREAM_DIR:
-			case ECM_STREAM     :
-			case EMM_STREAM     :
-			case PADDING_STREAM :
-			case DSM_CC_STREAM  :
+			case ECM_STREAM:
+			case EMM_STREAM:
+			case PADDING_STREAM:
+			case DSM_CC_STREAM:
 			case ISO13522_STREAM:
 			case PRIVATE_STREAM1:
 			case AUDIO_STREAM_S ... AUDIO_STREAM_E:
@@ -659,10 +659,10 @@ void av7110_p2t_write(u8 const *buf, long int length, u16 pid, struct av7110_p2t
 			case PROG_STREAM_MAP:
 			case PRIVATE_STREAM2:
 			case PROG_STREAM_DIR:
-			case ECM_STREAM     :
-			case EMM_STREAM     :
-			case PADDING_STREAM :
-			case DSM_CC_STREAM  :
+			case ECM_STREAM:
+			case EMM_STREAM:
+			case PADDING_STREAM:
+			case DSM_CC_STREAM:
 			case ISO13522_STREAM:
 			case PRIVATE_STREAM1:
 			case AUDIO_STREAM_S ... AUDIO_STREAM_E:
@@ -773,10 +773,10 @@ static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
 		case PROG_STREAM_MAP:
 		case PRIVATE_STREAM2:
 		case PROG_STREAM_DIR:
-		case ECM_STREAM     :
-		case EMM_STREAM     :
-		case PADDING_STREAM :
-		case DSM_CC_STREAM  :
+		case ECM_STREAM:
+		case EMM_STREAM:
+		case PADDING_STREAM:
+		case DSM_CC_STREAM:
 		case ISO13522_STREAM:
 		case PRIVATE_STREAM1:
 		case AUDIO_STREAM_S ... AUDIO_STREAM_E:
-- 
2.25.1

