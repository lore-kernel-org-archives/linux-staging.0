Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DED13483
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 17:09:51 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so6563488oth.7
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 10:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y620cawYnn+4V0Xna0MPjJG1IYCOfnYjGSth9ffrkPU=;
        b=bnaU90Pbow0j2N/VSOEIDfj9td1aWUrUZz2/hhYEZSc4/Vb2/v1Btcfw8zeWRNQiIP
         Ds6r6roWPX9w8/Vcsfsj4CIIVo3trxmUHPqybbwtR8AV19d4el3RePdiikWW63kSVb5R
         s4roTm0cYRfS4eXlsQIFCJS1AeDfJv/hoV+hHC9G4LlxYl93SwOfsESrcu+S6WTVvqsl
         X+4lw6V+7mTS5exMxVVdpOkLmJsnf7QMQXVVfQ7UFeZvS7ThnHahxzIq+NtE46wjSEiW
         wHlRk8FnnpeJxoASbJC0503baUWm9FCz3FIM5fKiqN7nfSXUtghmZb2nmWEoKTDraO4b
         B4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=y620cawYnn+4V0Xna0MPjJG1IYCOfnYjGSth9ffrkPU=;
        b=HOwhptIiPjk6QaxzaB0B8tXKXDT14cw4iESqbOJE8RogRu0VfzyLRWB/ERzxfqune2
         8AUEZd7NIYhc/4TfOJgUsmC+cy5d2k7wY11U3wdw/SbN0uWyrjwxjL6L9RshTMw5tKbh
         yJVZZJZ2GDl/qzTDgcHdouizeQgpnsq0fViorqP1ngl2xkQo1hzWdIT639lBZ6VLEQER
         8vexmEDbJytF6DNWG6e+s9K075Q6PSIe27Z4uQi8E7pBUx73gjWmdEXvla+anvQInu8s
         jN0c5Fut5rS+ceBHpgoT6YswJMGiAPLK3+3JpPhcgOD+KdBuW9+5kJ7DS0hvJqmHVW33
         kkxQ==
X-Gm-Message-State: AOAM530RnytM/aH+lqOuRMgCKfeIM6pJ9VAS58kwId0zPrf+S4VoR7cW
	WiHHxs5he/qyJsJMjqMWNEQ=
X-Google-Smtp-Source: ABdhPJx8n5eGvUzd1xw+yysVYKBGYHpoXipWudoxZFQqXVWT6KvJxAMjaFLZYL/r+Hgte5i8MDIn0g==
X-Received: by 2002:a9d:1d7:: with SMTP id e81mr4208718ote.106.1627578590377;
        Thu, 29 Jul 2021 10:09:50 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id a23sm614358otv.79.2021.07.29.10.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 10:09:49 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 6/6] staging: r8188eu: Add "fallthrough" statement to quiet compiler
Date: Thu, 29 Jul 2021 12:09:30 -0500
Message-Id: <20210729170930.23171-7-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
References: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiler gcc11, and possibly others, emit a warning when a fall-through
case is found in a switch statement. Add a "fallthrough" statement to
eliminate this warning.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 021044768b61..488a18133e59 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -460,7 +460,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 			ptable->func = &OnAuth;
 		else
 			ptable->func = &OnAuthClient;
-		/* fall through */
+		fallthrough;
 	case WIFI_ASSOCREQ:
 	case WIFI_REASSOCREQ:
 		_mgt_dispatcher(padapter, ptable, precv_frame);
-- 
2.32.0

