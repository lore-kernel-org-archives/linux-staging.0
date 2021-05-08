Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B665771
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 13:16:57 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id w4so15070817ljw.9
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 06:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQGOlx1y8xhrLtj22U5j8Zg9KBmr0pSSDAjHsnxb01o=;
        b=I5kjCO5ApJPpGf7tUK7/V1OjgeR5svT6W8embMQCIl5sIXvbS1ARPasMPams9FE71w
         kI4yrYQEWVtNTstGR53mTeAOXQr5/gZWrhz+tMR5hhGmboA2I4mvTtNHIeTYdnUg+Hrm
         L1n97AOuHhWmjPzJvYC5qrbGuvt0kY1E6b1gE8JSL5WinNjV0s2q6I7Rn60Mo+Ad9TCW
         UFdqobc+p6FjEKCbWPCB0WF//qEOqbXMS1yPfGuz2XaUUNHaK3PIMUqPIzuo69UgoWry
         ac9kB3Oy/yoAXhxi02drTvpoe5GUTSl0FsAPeGNL8FoO0aDwIRQCxGShXaH6xfVmVDQZ
         rlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQGOlx1y8xhrLtj22U5j8Zg9KBmr0pSSDAjHsnxb01o=;
        b=MVvBjJoQ8k1Ul9wWJqMwb+amYL8VkQlYa2TeqjTnPyJzGh835p8Ob0FnDOTQ25v+rP
         0Q8AvSNzkgPmizMoobZL2ZdtxgQx0vXb+JgJBLRn0iYHFAQX7vuiJdSYkhW88MfoaoPl
         RTu4VVoHyWER6bcDljhbIIIjXKf8j8drXLjFDBz74YVreqP8qxFTUJrwMZQHt9pyb4FH
         eGY4zq+1o4rE26b4lLJ3imtvb1+YD/BIUVCKsHBKnjAoQa08Ycr+BtwLY3N3mOMtMECh
         jGh4PirzKU2kjBEO75KSOeUXnRRPkBgmRfgt7f3fHHNzPeQM35ambTXu9fQ94GW3xGMj
         6o+w==
X-Gm-Message-State: AOAM531qGTvizNJCj7+4tPWDWbGpkNl3xy2C8MBfygbJXQTxKXJFRNUv
	thIjpUCRw5dJHIU7I1orgDI=
X-Google-Smtp-Source: ABdhPJx9n8nzZvFCVZh3ez6MBbSoJMwUFIQI79Clvmm8Ib7vky89gPqJbIk1Fkk43axempwQRXKnVA==
X-Received: by 2002:a2e:7a09:: with SMTP id v9mr12485962ljc.33.1620479816024;
        Sat, 08 May 2021 06:16:56 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id p2sm1138376lfc.115.2021.05.08.06.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 06:16:55 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 0/3] staging: media: atomisp: code clean up
Date: Sat,  8 May 2021 16:16:47 +0300
Message-Id: <cover.1620479607.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508124334.GA1403@agape.jhs>
References: <20210508124334.GA1403@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series include code clean up for input_system.c.

Changes from v4:
  Fixed commit message in 3rd patch

Changes from v3:
  Removed returns at the end of void functions
  Split all changes into 3 patches

Changes from v2:
  Removed useless returns


Pavel Skripkin (3):
  staging: media: atomisp: remove useless breaks
  staging: media: atomisp: remove dublicate code
  staging: media: atomisp: remove useless returns

 .../hive_isp_css_common/host/input_system.c   | 62 -------------------
 1 file changed, 62 deletions(-)

-- 
2.31.1

