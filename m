Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142D53483
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 10:37:22 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id h9so520849ejs.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DMfu1srrrCowux2puKJtVzqFqMeZgfFMHDutBgFq480=;
        b=b6KKUDLAr4Py7iKkMYzaXIUyLwZ+ZLkZQkrFVSQTVprgZHQIB3fyACoqwKIPg7krzt
         nehYEz6WwAyxRyOkJsE0bwecsbWe0x57YAmuKpyN/JI2DBFGXSwfbukx/tlWrabsoHk7
         ZE1/9A2kinsibOa7xlT9wx2TlN0cOs1p/hav7mfGxc3R5ehxVNJIIDW28tvQgkjs2DM7
         Dv3KxBkpOXLLHze+OJmz3BZMe9eMRyq/TYCFR5NAUnxGqWtM3u7eXm69eDTAKV0EaT0W
         Gr5YiZ/G7KYHtPBB4OFIfNVvI+0vhnT7+1R/u0iO47x53TzHdGfw3D9y0Od2xqBEMSM1
         fuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DMfu1srrrCowux2puKJtVzqFqMeZgfFMHDutBgFq480=;
        b=MMZm+ujRMX8Q3lvKL0WMInqcQHZ0GPXWVXiR3X3FhN+HrO1NOmjtTcdsh5WjqfeWLn
         yEVeeRfZer5qEtCz4SiIYoIE4LB/QWlE5NToHHA2BDxWgRJml1tRyRWo06elWDxFutXJ
         te69CeewHug6i5iHILygzBgedCsK06ReYBIePtoCldeOt0zon/I5yW+LW/VRMDWAJwOr
         uIeyKVb6QMORHBnkbIkx/ed9d8VbWruYVymGCtAKiByJKysWOTk1aQPcmg3Qxi8503AQ
         6+b+Cc4wKKM7Exw2mVELVWTKGa+YdBrnCO5mTkaYTo2SGTVBzBv6DgSAlXBgrHsLEE4j
         ObrQ==
X-Gm-Message-State: AOAM531/Vu2jQz6QORwwGoz7S7gN1MV5G4TPi9dL/TtimTfKx5eA6iyf
	mCXf+xVEXWw2fyNXkRhZA08=
X-Google-Smtp-Source: ABdhPJxXHnxYDFphlFhEYaM7ywgHmUqUTabi55Dg4QFe3B2RD2eNRdIj9tmTDL1xtoPAZAN/UMdALQ==
X-Received: by 2002:a17:906:31cb:: with SMTP id f11mr1924227ejf.379.1627641440426;
        Fri, 30 Jul 2021 03:37:20 -0700 (PDT)
Received: from localhost.localdomain (host-79-26-32-124.retail.telecomitalia.it. [79.26.32.124])
        by smtp.gmail.com with ESMTPSA id v17sm493436edc.47.2021.07.30.03.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:37:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: Use in-kernel API and remove no more needed symbols
Date: Fri, 30 Jul 2021 12:37:14 +0200
Message-Id: <20210730103716.27210-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use crc32_le() in-kernel API in place of the custom getcrc32(). Then
remove no more necessary functions and variables that were needed by
getcrc32().

Fabio M. De Francesco (2):
  staging: r8188eu: Replace a custom function with crc32_le()
  staging: r8188eu: Remove no more used functions and variables

 drivers/staging/r8188eu/core/rtw_security.c | 111 ++++++--------------
 1 file changed, 35 insertions(+), 76 deletions(-)

-- 
2.32.0

