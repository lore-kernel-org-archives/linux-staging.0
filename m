Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C81A435A
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 11:24:55 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id o10so27992135ejd.1
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LSGVVstA8xSFKqm3J0T/OWA7Sm6ZWqDMvi1oUYKoUQg=;
        b=DPV4As0LqO6PxUoMkKt+gD4Sp4g81m4Uyo0RMYEz2E3P7pfyvtdXjGrBNZDHBP/UB1
         gCFttcV0hthj4q1bL5TNl0zgC1lGn7IRag4nBKsJ8EP2YePrQZ13CN6W5Sfvfp8QF2Sp
         wELX/+cizZqQx47zB7fGuZ9lFxr9AwmUsxdmwe8MW4eic5SAUeR1O8wHo+TyZ21CIyay
         q7N3FAUsLSw2T7TAwO/n3REWByJ0KsJHuB6v+wB5DLXByNeI7ARpMC1EcyMes+d0d++3
         Az1f4uQBXYfarp3CB4XKNCRn8iHQgyIum6DxyH2giFC9U76PXYn+pGn9yYRL50TSN3s1
         2OrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LSGVVstA8xSFKqm3J0T/OWA7Sm6ZWqDMvi1oUYKoUQg=;
        b=1yHnz5Ys6DNjtyQZ9N7gSO/iLx12ECk1aSpDW+rFlSYjky2SayFkrOPXUOVVrYJVpa
         Ey+FeqaTtglHtBwHyyW4z3PPQRSxowb0Qg9Wvm8pUa1nmOFISyVV7jY0yFT/F8gvcUCp
         pq7b1s5c7vGw1gTfw3JBYqLF6d5Ai2mBbK88QPGtmU1OgKnIpackIwnLpFgr8xuzIkBz
         vpuZk5hP3f1k02fEfMhnMZgc2rkq2rIsMjj90IogVO7um3CBSy/fQQO1n1YHs/b8oINJ
         dqJXEUTUbpJXpCpmURAt0t1uyz68AKtiTamVv05SS+W+a72Ad8qRR4RS8kDxrLqFRpo7
         8Zjw==
X-Gm-Message-State: AOAM530HJGGemIeMW40Zoy+IgJlZP9Q3Zyi5ND6dNLPvHS7iF4ivr5bN
	dMj8sbGmOWTghDxIhLn8CtLtnSVD+p0=
X-Google-Smtp-Source: ABdhPJxl6boSwWBk+hJgPWLFTN1iKFHKVHLRcqYs36e+eXokFUamDhBLmr6Eju0TLSaJYffp3TOQTA==
X-Received: by 2002:a17:907:1623:b0:6df:c9da:a6a8 with SMTP id hb35-20020a170907162300b006dfc9daa6a8mr26762275ejc.303.1648466693755;
        Mon, 28 Mar 2022 04:24:53 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm1839730ejy.93.2022.03.28.04.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:24:52 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Philip <benjamin.philip495@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Charlie Sands <sandsch@northvilleschools.net>,
	Mitali Borkar <mitaliborkar810@gmail.com>,
	Colin Ian King <colin.king@intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ira.weiny@intel.com
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rts5208: Convert kmap() to kmap_local_page()
Date: Mon, 28 Mar 2022 13:24:40 +0200
Message-Id: <20220328112440.17756-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of kmap() is being deprecated and kmap_local_page() is faster.
Use kmap_local_page() in place of kmap().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rts5208/rtsx_transport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx_transport.c b/drivers/staging/rts5208/rtsx_transport.c
index 805dc18fac0a..de690d7ee5e3 100644
--- a/drivers/staging/rts5208/rtsx_transport.c
+++ b/drivers/staging/rts5208/rtsx_transport.c
@@ -92,13 +92,13 @@ unsigned int rtsx_stor_access_xfer_buf(unsigned char *buffer,
 			while (sglen > 0) {
 				unsigned int plen = min(sglen, (unsigned int)
 						PAGE_SIZE - poff);
-				unsigned char *ptr = kmap(page);
+				unsigned char *ptr = kmap_local_page(page);
 
 				if (dir == TO_XFER_BUF)
 					memcpy(ptr + poff, buffer + cnt, plen);
 				else
 					memcpy(buffer + cnt, ptr + poff, plen);
-				kunmap(page);
+				kunmap_local(ptr);
 
 				/* Start at the beginning of the next page */
 				poff = 0;
-- 
2.34.1

