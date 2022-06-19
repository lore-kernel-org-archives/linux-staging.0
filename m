Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013EC7B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 19:42:50 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id go6so3621232pjb.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 12:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nCs87Dk/aKCfwCETT4OMFZvnQ0qo0jo5IYu3+Wptn0s=;
        b=fwYlDqRSLxTMl5+ku1DyMIQBOAuUnuVibTqYnRU3/vT2MIXjw2jzjVP+CG8tOerlZm
         DAS9S4Ze26zFEPbEE02guXPqS3OsObT3HuUe9UuTC4NScQ5ErHgIBikdhyWO5rBpHV8R
         BFzI6ygy7/JmFitOivznMsErlWTuXlNKLmUWLMZbFCfjpMziwTa8xwxpMuWtZdwVaETK
         RKX/Kt+xOoh/GMk6UpROcB7652pvOydb7MnWMN+jWCZNcub++mY/6O2+Dh4iipfP2YN+
         A7o7OV4cspXKvytT7VnliUtOt0WTh1pxrDZ3vglyTCPQRs4Tcp8qeP3/BUJ3umOUUFJF
         feqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCs87Dk/aKCfwCETT4OMFZvnQ0qo0jo5IYu3+Wptn0s=;
        b=fX2SQPwpg6DzwvjJRiG1BeVzORoz+cWipSOw/oWk2nKGvmTgEwEF57HbmtrIWv7q5l
         s9iMHzHH054nmixlOhiRICYExFxt1lRunbPmMecIHRpwqvrIZuuqtOB8RgX8JvIt9xQc
         n0UVq4bsvRzoOwz77bQMHl7C9UROH9oBkT+Pb5wM/B9cSc4wtF+UzUDMO4pGcq0gZJfr
         G07UQJ5pg1h3PME+N4/V7tIoDISBfW8eKCLZjeKZ2zuNPy4afHGl8kGgEVx+bZhSxA/R
         trClMCagHFFIUZj9v9LYUFMe+1mPk43holL5ytG5/v6WY0/odwDjjlqp0R+L1jQlKCKj
         fBVA==
X-Gm-Message-State: AJIora97YcilTNH74biADw3fDqWmcWCsTmFEphowSwhP0NRhpguxjP/+
	cz/c57+vmmDDKQ1bCRqpDCI=
X-Google-Smtp-Source: AGRyM1segxxj5LTL7p0h4ydvGeT/uE/ijZCyoz+pBMMGd4fYW0IoeUCmajONVnjUqJviS7CNCvt60g==
X-Received: by 2002:a17:902:a405:b0:167:97e4:6038 with SMTP id p5-20020a170902a40500b0016797e46038mr20419475plq.144.1655667770304;
        Sun, 19 Jun 2022 12:42:50 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id j16-20020a17090a7e9000b001e2afd35791sm6732389pjl.18.2022.06.19.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:42:49 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2 0/5] Fixed some coding style issues and spelling
Date: Sun, 19 Jun 2022 12:42:26 -0700
Message-Id: <cover.1655666628.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618204454.16071-1-marcus.yu.56@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a few coding style issues and some spelling errors in the
comments.

Changes in v2:
Separated the original big patch into 5 smaller patches so that each
clean up is in its own patch.

Chang Yu (5):
  Staging: r8188eu: core: rtw_xmit: Fixed some whitespace coding style
    issues
  Staging: r8188eu: core: rtw_xmit: Fixed two indentation coding style
    issues.
  Staging: r8188eu: core: rtw_xmit: Fixed some spelling errors in the
    comments
  Staging: r8188eu: core: rtw_xmit: Fixed a brace coding style issue
  Staging: r8188eu: core: rtw_xmit: Fixed a coding style issue

 drivers/staging/r8188eu/core/rtw_xmit.c | 28 ++++++++++---------------
 1 file changed, 11 insertions(+), 17 deletions(-)

-- 
2.36.1

