Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7A2C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:11:13 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y12so49479405eda.4
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4EM98EaZ2W2/VutwjhCwiL722S9g8c/C9oXvcE2zIU=;
        b=o0m3TEk9IwXY7geF5+TdJLR9GuOY5//qcCPBZYMRN1NbI/htqkuCovzt5p7uFKuOPl
         Z90b2BCMTj1n3wtjcCop5X/WHHQPXoQChoPYfPwT3f9ljACdfJC36SlfpD0QtXMFSyT0
         R4r9e2uuipJvUUH8ToToGwYGz53fUnHFWH5U+OGVHjLvPNvNciTJ7LyD0HkwNDbCrr/3
         pQUOg0NAvT6nsYnyk316BeHRvt368Vprd6Ci10XCFn9+XJl05A7tEhK2TvbNlYEzzy/Y
         JqgOEtwMjabRRQ0eevhvDxETM7nMyNQx3ODOo+ZH/JzLfpwKTowE79N/7lgxcry9lrO9
         H/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4EM98EaZ2W2/VutwjhCwiL722S9g8c/C9oXvcE2zIU=;
        b=XIgz8vQzzm0Ihi0DcJvWmHVTTfCt7MUTckgKTj9Njx32y5L3X3y1qaFDxq9moXezNh
         oCVB8MO2gQhjEIVCRO5EuKo5KOllPAZ0V0uftFqHOzgcI+7Y+iA10CtvAR/YOB7GpUUI
         UL9/MboG/3exj8LE4nZDAoNEOT/k8bn6uxwwnipsoP9Mn828lOhovUlLNGxigE5JAJkt
         9W9vT2amFmfIghcQGYKUbh5l4DLCub/CjQZgPoLvf9SxCK60gvImPnmLmc9pMBoeFlNB
         9rsaur0MUZWXbK/MTg3SJRsduSI9z6zTo3bvFHz5Fn/PVdd8+KR+wFEP4667xR2FikDw
         jM7Q==
X-Gm-Message-State: AOAM531Ebx94mEV2YTt458jxnLxG27JvI5Js/nobU7a4MbBgFaMhrN4t
	QueL5ixl7NL7q+bq7Zfb2Hg=
X-Google-Smtp-Source: ABdhPJzZvX38bar/yqVJ5b1UDM5lXr2bcAsSsr7fngrhFgHxr7voDwbFNlw7WVWikWF0Tgv5dHcOTw==
X-Received: by 2002:a17:906:6b1a:: with SMTP id q26mr12507273ejr.185.1634375471820;
        Sat, 16 Oct 2021 02:11:11 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id o15sm5934723ejj.10.2021.10.16.02.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 02:11:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: use completions and clean rtw_cmd_thread()
Date: Sat, 16 Oct 2021 11:10:39 +0200
Message-Id: <20211016091042.19614-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces two semaphores with three completion variables
in rtw_cmd_thread(). Completions variables are better suited for the
purposes that are explained in detail in the commit messages of patches
1/3 and 2/3. Furthermore, patch 3/3 removes a redundant 'if' statement
from that same rtw_cmd_thread().

Tested with ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano]

Many thanks to Dan Carpenter <dan.carpenter@oracle.com> who helped with
his review of the RFC Patch.

Fabio M. De Francesco (3):
  staging: r8188eu: Use completions for signaling start and end of
    kthread
  staging: r8188eu: Use completions for signaling enqueueing of commands
  staging: r8188eu: Remove redundant 'if' statement

 drivers/staging/r8188eu/core/rtw_cmd.c    | 19 +++++++------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  5 +++--
 drivers/staging/r8188eu/os_dep/os_intfs.c |  8 +++++---
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.33.0

