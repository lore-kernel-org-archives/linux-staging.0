Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634342C876;
	Fri, 13 Oct 2023 23:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWSnP5SA"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57bca5b9b0aso1406026eaf.3;
        Fri, 13 Oct 2023 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697240848; x=1697845648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r89DHYNFueYR4hgHMDPSPQFhhiG/h3pT42UPfUI4Rls=;
        b=BWSnP5SApSZLVQjDXJeCIQuY2wfkTad0P7RP+LcvwnwKSVP7pfqQPfapo3jdgK5x/g
         GM01i/C6CHiMBTxx0XT9BMXbo/L4mxd95IOePr9I0QNQ5fE+FtQ8W54pAiIJxj/9UfIx
         tSHdNUIqRNSvo8aOoFq1mBehgVRy03NlnLgt8K9WjK/eAug3dK2QP89DpZspkJpNoHLA
         lY8ws7RICX6YyGfBHCFVelG3WbR6m1Fs0uctY0EUUXNTJDygg7wf0GExHimhL/iOYW48
         tnZRBkDmJdYKWmZpYh6on19rLtCR0ojUUW3xZ4eSjfhNyVGgabv82SGH5QEv+XieTakt
         9Skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697240848; x=1697845648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r89DHYNFueYR4hgHMDPSPQFhhiG/h3pT42UPfUI4Rls=;
        b=ZYgKSLqhFp225ci/txNaa59QG6brIjPSZE+3HOeDZ1zpzS9OeY9Cjehv/nXx7PeO1I
         kNRvm+Ddl6oQJ7YYIHb5/XmPV70Mw116oHLfWrx85nrbzowlURFYv1OD0fXHlE5jH6SG
         TBcgjRh648wCLmYMdGHKPVd51y1J2B69CqcabzE+IuLpfxS+LhnvdjwaghtKmKf1dMM8
         QG1F/cXfutSQ7wrlJc23s4jehDTh7GQbaSh4aTzp5hbKAH0sHDrXvZ0MHcqfXsY6t/q7
         JK9YFLr6kLdTLClK/ten9MNVVhUgDH0RPQkDN6YL5YD3QgB2OSN+h273uan1C11AtVOa
         65vA==
X-Gm-Message-State: AOJu0Yxuyr4Lbx7KMvFCU8DiGc66rRC3ksuGgnzId55y3OPcZLBwDTaf
	nfAtPOlbZ6NzaGhRpaSygT8=
X-Google-Smtp-Source: AGHT+IHpm9L9w26cR56Xl0+1a/XfcF/QkUYxetvJQ0A+dROfp7mUBHZhBJzlpVkHR1SOBSjca4y1Cw==
X-Received: by 2002:a05:6358:785:b0:143:82e0:8cbc with SMTP id n5-20020a056358078500b0014382e08cbcmr32934611rwj.1.1697240848301;
        Fri, 13 Oct 2023 16:47:28 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id f6-20020a637546000000b0057c29fec795sm3909355pgn.37.2023.10.13.16.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 16:47:27 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 1/4] staging: vme_user: Correct spelling mistakes in comments
Date: Fri, 13 Oct 2023 16:47:13 -0700
Message-ID: <f41caa8e7c987fdc010942838117fece8151affe.1697240381.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697240381.git.soumya.negi97@gmail.com>
References: <cover.1697240381.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspelled words in vme.c. Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/vme_user/vme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5960562dcd96..80083ea0fb53 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1603,7 +1603,7 @@ EXPORT_SYMBOL(vme_lm_get);
  * @callback: Pointer to callback function called when triggered.
  * @data: Generic pointer that will be passed to the callback function.
  *
- * Attach a callback to the specificed offset into the location monitors
+ * Attach a callback to the specified offset into the location monitors
  * monitored addresses. A generic pointer is provided to allow data to be
  * passed to the callback when called.
  *
@@ -1638,7 +1638,7 @@ EXPORT_SYMBOL(vme_lm_attach);
  * @resource: Pointer to VME location monitor resource.
  * @monitor: Offset to which callback should be removed.
  *
- * Remove the callback associated with the specificed offset into the
+ * Remove the callback associated with the specified offset into the
  * location monitors monitored addresses.
  *
  * Return: Zero on success, -EINVAL when provided with an invalid location
-- 
2.42.0

