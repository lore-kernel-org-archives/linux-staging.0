Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F92C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 16:20:23 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id d3so1387069edp.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 09:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1a1lZasOkjsVLxfEpqTRh9pWlKYrLyxR2OKNtm8b7Fs=;
        b=Us82Pzpe+3m6oR50xgihLqygKNRpNOSPw7IvpLcNGvtbXm0SP40NLABqu+mwj+tvPu
         UABGBqx7KwmerklKb6Lc9HHz3nEJSWli7DTeqSIEYxZfvWuv5WbCQ08qJDVWI9K31kLR
         4Oja2GYz0UXjGaN3WJlXCGvbGXIn0WQQuRmr2L++vWxLwuLEMsJ7fIuit3EzmRUPj++R
         K1nAhMIxDQ3xBP2kYGPj5KkFXPAOe9d8tXcBLEaTxF7gnfKawqEWKTCt2sQBRUDCojV5
         FnlH99DimX7Inp54r+apIIdUwHsU64r2LX6s7JPHUr4C2bCBvoR+6a18Ey1B7GDLvIbs
         R3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1a1lZasOkjsVLxfEpqTRh9pWlKYrLyxR2OKNtm8b7Fs=;
        b=NqxckdoKivoZKpQLzkEw2ZO/CgdjtGpm0YlVbq+g+AUG6uJsSZ0LDsdNFC5YH9fKsy
         Avl3DjDcdHnF3y6PM++y6LLcbeW88xIZEAb+uw0oQGBGMi5mtSMbFyfatll7CEJY5eV5
         +fAvhI/wJevKBVonpIogtsUWgH88HX+UkIj/jPdNO9GCtT8Ov23/wVAv7Y/UQyMxw8bm
         xwAYLzUpWV9QNshVVl8Wyi/Y9V9meUh2LAPLtmAAuLlMq8VAIx083E2xPLZrglLHsYI0
         XaIRLc99BaD6N06N+U/RgQEnuTT40oH78bB8DS3Wria69oTD03q9QnscfaIOO/HkwEgh
         901A==
X-Gm-Message-State: AOAM532BsgsdNQsBd/Kz6f/xDvo8cQWkqc7fAPDGvZXQHo9nU3tK8Wdu
	uiIt1YMUTCw/wU5E3s60vmU=
X-Google-Smtp-Source: ABdhPJw21c2ayrDkQVBjS5Sqyoc1IQMcDs1mlQMHYciYGzmRmoEseEDu0ubOVWjadPFsr77DnIEW+g==
X-Received: by 2002:a17:906:5a8d:: with SMTP id l13mr32442600ejq.95.1634574010476;
        Mon, 18 Oct 2021 09:20:10 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id p7sm10045791edr.6.2021.10.18.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 09:20:10 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 0/3] staging: r8188eu: use completions and clean rtw_cmd_thread()
Date: Mon, 18 Oct 2021 18:20:03 +0200
Message-Id: <20211018162006.5527-1-fmdefrancesco@gmail.com>
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

v2 => v3:
	Patch 1/3:
		No changes;
	Patch 2/3:
		No changes;
	Patch 3/3:
		Furher process the commit message according to a review
		by Greg Kroah-Hartman <gregkh@linuxfoundation.org>>.

v1 => v2:
        Patch 1/3: 
		No changes;
        Patch 2/3: 
		Replace wait_for_completion_killable() with
		wait_for_completion() because killing the kthread is
                not allowed and so there is no need for killable
                wait;
        Patch 3/3: 
		No changes.

Fabio M. De Francesco (3):
  staging: r8188eu: Use completions for signaling start / end kthread
  staging: r8188eu: Use completions for signaling enqueueing
  staging: r8188eu: Remove redundant 'if' statement

 drivers/staging/r8188eu/core/rtw_cmd.c    | 20 +++++++-------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  5 +++--
 drivers/staging/r8188eu/os_dep/os_intfs.c |  8 +++++---
 3 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.33.0

