Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4FC32D0DE
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750328; cv=none; b=OTJGTU1F6qJLTKfs9MM/bGocwjQk6PZdFRuTyGZFW1qg1emsoBh1/407fXQpoot+rpSq9ybjP5FQ2wK+tebXjW8EntNza9IoCrq5lhwvmkOALQaV4atF4lUI9OlG9fnduZ8EQXXVaGgBFl6fWooqmBJww0AVLHzvI9RYCgmtzEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750328; c=relaxed/simple;
	bh=1SK+KtZvEbEpqHVA73v9ax7ST3arkHcNNUhN7WXLBco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aaouKZzpTC00opDggxzbGmtt43iJsUE2bQtWRp8p1Uchzx6A+ZhDxOxxkUn9MR+CwO7wzR9o6lR6SCpCM/DbxpMxJw2tTTEkzRBlGuOSjuh0bwy2IjFXwaP6NSc4ytM2iiyKtqcivqyOiGyym3Sh+u0pRL3lvIwcgaa07OJ1XPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBeyhQoX; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBeyhQoX"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2046045eec.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775750327; x=1776355127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2izecO73IvypyZQMsOkvk4r8Hx4/34uvh+o5G4CY8M=;
        b=CBeyhQoXf1F11WBsv9YCJj8BsmXaoVXly2DooCjMerGzBR+autbfNUBnbCRMiDpf8Z
         7rm3goV50u6d6yLiZ2eOu3J6QkjVlL0R0Hb+dJQ6h1Cx0JxHiU3uWVXl3ehWXlfGg8sq
         yED7m4YXwEd9K78SuQjisIy5e8/skAa8adxxzt0QRLSJDHKpfS2Vu4QpQk4nZUGonJT0
         nRcRi7fWIy8Cydtt9sbKFDYToIkv8spHd3yKtNF+DhJL9vLh9dFtTlfkyy+p27/TlKjh
         XK6EwYlJ8RZl6c2BwxGsM+4t5WdE9lOYCJlb3Usj9RnIwPtUUSCGI0sjEiLedWMuNh1G
         tHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750327; x=1776355127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2izecO73IvypyZQMsOkvk4r8Hx4/34uvh+o5G4CY8M=;
        b=nzG9jyRHxibu6xaUUHzSCbJJg/KIAwpchmXZbyqzlP9+n54VcNz89qAi9PwGM3f4Vn
         CGTiNpdQ181SsXwXGr5dfI+gqpTbBa0TjipbdF35xhdl+pTwF7aGlD4keR94tP6CeLTS
         gPdKHpjT5FW6ghoT6bjY3gOrkooWESdnIsplXnoi6WEiMUBG09llY3IxPx6+NDVSlpgN
         aRQ4QrdB+/h7HMbputv82wIST1knRyw8CSG1mITDaOZHB2/fT/6C/m8l5cv3hltqpLBD
         lZ1LL0UbLpxr7NFTCO1vl04IPJh7IAPNooNs2K8nYtET9UPQLeGeEF+iiSKUFlWLOc9y
         yAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGncUc7Yb6a2qQ+Uzxxd9uQj4WczxAPQ1zMTfgGOT+z+a41Mlizt43acV8r42Cc/JH9h1LcveCC7x8+/V9@lists.linux.dev
X-Gm-Message-State: AOJu0YxKtwnSBfue6MhLZd9bl9t6a/JgNmFVEMWholGSnXDBTgZv/6rA
	ByHz5Jr4RFZyJyZ7IP+LsoN8ic0KZnm3XrOgtBnKayaG+fY4H1/BY8M2
X-Gm-Gg: AeBDietUhwQuOhtmBzziFdDqe/BmuxgQMAVwPL7mo7lreloWHr0sz50XQgIPvUsmli5
	dX7NFDDwZnRJIXNOtnD1KU841nNgD3VIo6qAlQn955SEIzIWMAPZmxI67yTMDJqyxKsw0WqM3kT
	n9h4TfV8B1lD3sN8NGTrP3qfv8aki59Q7s5HtaHlgs10RAv9bvNzc+PAhT6rzhtBUlgYzrJ/I5m
	okGWzDjSiu+DUEYGER91ICd7tixthzTSwR1vL7nHMLSdAJaaYDprliY/4g5yAVPCfqlIv1Agexb
	tleVFVOijBNKKsDvrkXeh1/X1pU2AO9rFUQS8oIjCXeZaBDfBl3jffMcXtECNRmLq054c1wNtWq
	XsHGXoYvUPrwvYz5paWgHQPwykTKjGAG2RIDpLsPjoKMqVr9nQbOyfa/aRrtvtHfmxpPDg8kHWI
	IUFmoOnjA4frqdJKo8cXxMUt6OCFfOKb2Ap6kwuk4JIhMyvQ5oLAvpHq0=
X-Received: by 2002:a05:7300:4350:b0:2d5:30fc:399a with SMTP id 5a478bee46e88-2d530fc3b41mr693229eec.7.1775750326403;
        Thu, 09 Apr 2026 08:58:46 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm153746eec.21.2026.04.09.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:58:45 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/2] staging: sm750fb: improve error handling in de_wait path
Date: Thu,  9 Apr 2026 15:58:19 +0000
Message-Id: <20260409155821.23375-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves error handling in the sm750fb driver.

The de_wait() helpers previously returned -1 on timeout, and
callers discarded the error code by always returning -1. This
series replaces -1 with -ETIMEDOUT and propagates the error code
to improve error reporting.

Patch 1 replaces -1 with -ETIMEDOUT in de_wait() helpers.
Patch 2 propagates error codes from de_wait().

v2:
- Restore the removed comment in sm750_accel.c as requested

Hungyu Lin (2):
  staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
  staging: sm750fb: propagate error codes from de_wait()

 drivers/staging/sm750fb/sm750_accel.c | 20 +++++++++++++-------
 drivers/staging/sm750fb/sm750_hw.c    |  4 ++--
 2 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.34.1

