Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C42C80
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 23:49:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a9so25673118wrr.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YoZPnfaFJm1NVGIE6alXIS6Xkly4h3Gf7r5uJzp6qo=;
        b=bdEZA77yoCy5jlDOF7fcFoNBfzO2ekyxfZSZzS01rgsPfbwtoWttmnP7JhjaOo4s5j
         m99znndbP4+DVbcrdx+Hs81FutU+7lQw/McRotYEY24VAu4VQbfkFLaPEOAPQpHQwrEk
         OmSarv1sg+3ZIrNtsJGVortqFr9zY1yRyq8REhSo87bst39hX24N4kt78+zFAgGBtqSI
         obShZR4OlboBrP8bM4up+z79PZeefzPu4zGYk+2HUuecCX35B9agKMhHj4j5WpuKWWQ/
         mBNHU+oaRGFaGAn8pz1mFgjxfxa2DWs+1j1ST5kXgQSLYYuYUq49M3RJCqecs9Mkp1oH
         5DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YoZPnfaFJm1NVGIE6alXIS6Xkly4h3Gf7r5uJzp6qo=;
        b=itLpziVNBe0kl/V7tRFafXlJqqkPl0IQ14AfK1SApb3JvpPetVVhw/Xd0lle3SKGbF
         i8fkEj9xhmlng9N5gp+lw2FaeFhxWO7XQdJZFVwe0UZ51wlTA26nKosGtLFDzYUn5qLc
         LiWt/rALn+mjIv2M09yBjcTUl9w/n13LmyVCEywOdkl9gZBlfavFc+ynPPEQNO8jeDHA
         htRkon7ABt9qXToGYHPMBdSiR3KNoSMfLeTFz2DeI4eb0y+tYT21ZcMiBGbQm2re1Xh0
         RO4/hvY2c0DtZjpfgiq1C2UPekExk22qtxePsM3BiMpNps8FPzvRr5HfY2lkqXa7mU9e
         eYhA==
X-Gm-Message-State: AOAM533riI6tbZx/APkQoT3L/C5lkNt7CFlGRbIL2p+jR8H8Rxd9YtXi
	ftADXSLxLkKbxy0cAJxj5VqxjA==
X-Google-Smtp-Source: ABdhPJydKDNkKKzaBGXb16sp9mizC1P/QZ+E3EObbHbie7C01srEFFSWZCRnbfUxIu+HDuWA+cIYsg==
X-Received: by 2002:adf:f489:: with SMTP id l9mr48233855wro.268.1638834596484;
        Mon, 06 Dec 2021 15:49:56 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id k187sm1241189wme.0.2021.12.06.15.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:49:55 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: r8188eu: some DBG_88E cleanups
Date: Mon,  6 Dec 2021 23:49:50 +0000
Message-Id: <20211206234952.1238-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch set begins to convert/remove the 700+ DBG_88E calls
still in the driver source, with a few files to begin with whilst I have
time.

Phillip Potter (2):
  staging: r8188eu: convert DBG_88E calls in core/rtw_security.c
  staging: r8188eu: convert/remove DBG_88E calls in core/rtw_cmd.c

 drivers/staging/r8188eu/core/rtw_cmd.c      | 12 ++++-------
 drivers/staging/r8188eu/core/rtw_security.c | 22 +++++++++++++--------
 2 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.33.1

