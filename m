Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107D93E715A
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862289; cv=none; b=sjRebVHmkRhgxCS6gwZOYrmmFWCCQGG4j6hkDQrB7tC+FFh8+7Dioo3sn+qD8mGsVuE51MFUq2x6cF1mCLgnepnFsvfHqkbc1QiQeWwrPXuhFdGxe5tTYxHdEUs6q8HeWtCTUs88xy5kHQ9HdJ54okbyGifZMwbAL8cSHAZSJ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862289; c=relaxed/simple;
	bh=Oza2kwXNIpSn5CN9D2qAS13wqdmSFu8jzy+JgUjkcJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9PBp325jLPAuYGaVVxllV/2oIfoz74OrF+ZGQ61UujPsLz5/yRlWeFnBs0+HJHFcRYQxXdhilsUkKDd4qed5qQWU/WGvVPBE61B1JKknmOfAoVsHYLNznQAyaDIz4xPpr13rMXyOJxsflOVW8+lGggT13mwWnjum9YKYLtBUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYrpulu1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYrpulu1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso3420612a91.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776862287; x=1777467087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oza2kwXNIpSn5CN9D2qAS13wqdmSFu8jzy+JgUjkcJU=;
        b=sYrpulu16V4D6a5wFAInxfhXHyWjqlXlL8x9Dy0BApb18DkDePlJcp64lKAwIR8pNU
         lE7wLEUXi9nL1VnmPMcU5pm6+MxQd8Eb7fiPnt69E38R8/Ij2aWOJdD8Mi4uT2NiDvSn
         7ABs6SngxdNTwCJfc8I1gTxwCi1Bid592Lu2xFD/kdKcZ06HjNsZtJFmT2LlwVo93CHv
         YI9pHtTty7P3TDVZC15DWEqB9HV07gN9k9UvFfrrAnoS1SMpOu4haI1MmhpOeAP6t5Fp
         LyV4ruUaZE5nWLmO2x+YrxvDh97Xk8Eh7lR5aN+ehwEgXcFlldsS9wlCQIMtsPIUFaWU
         M6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776862287; x=1777467087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oza2kwXNIpSn5CN9D2qAS13wqdmSFu8jzy+JgUjkcJU=;
        b=An84nARiOVtZ7gOVOnrubHYcALmP587YmLhslwyWZOEUUapH7892h2t7nwdT/MZD73
         Dmqu7hAyr3+yYffss1MEM1h0IiqJV+Wnxx6z1HYDrFZP0bSnRtKrfMHXH5ZYNB8AsXr7
         ayLEGINbJ76ckS/OlklsU2Is98XfmI6eJVeTLOliI6MyBt/Eq6ZfRhlx2w/sGqWigdtW
         KVKXJxw9bGX/221Tn5yoY5PF5v1Jqa+0Yd2dfmUGZ0q9rnA9d6tUVWulHkLMnrGXvhoC
         yTL6jrPXBGs5yW8tWjvqTjU9/qQvlYuPiJ4oeZ78GapKTrClKcrIOgtTzKwzgchUAsmq
         69uw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ki3GvDfdj3nxKQXvaivEVCGJZqtBKtOi2VASmYC3/rAiSWfFc+EA5KRljBlNdQCl8+qExl5Nd9BR/na3H@lists.linux.dev
X-Gm-Message-State: AOJu0YyCgpQW4dy+oWRRas8pBSRru1m3DOkN9eqkfElqKeNhUicWQ61w
	NLiawNLgJsN5vwLufi/jYRif8qKQvPjFFJkHR+ViGi9GcrXvy9G2slc9
X-Gm-Gg: AeBDietOlKB7LhT9iSW4QysNlLn40qZaW2f/5Z1jdwxXJuIbD6rrHfU3wRb6i8Ooo+O
	09vE6Crvi04aKa+dRdQSj8P6KqGFQ9mAla1nnxLUEdbWNQRbeHwdQGo2orc+dcoJj37hJhXR3LL
	11gSAVF4Qj5h7NOjE9nHCz9kKrI9w0ICy5AduHlYI9lAISfzK/3sfguLmYY9UyQ88sfmw7hBPZh
	hoAZJBNQw0eoDcmnJARJxqTfBozQMi3O8lal8e9Phs7dMQBbiOt68mxPQNbIuaxFZ8zHTiHjuUA
	/gBgTk44yybuOKj3/hAuVJ3FJBT0omIvlh7gH2zYDIvyEm+zRXCQd8Uj0zhNSrUfy+4YPmSXbDf
	3EzFqoU+voXCm9VZLh024aVNg/OWApVnamrIn5K8g1dBGHtqgfETnOuGj0S2lm5nBv54Z/1rEcO
	JUp7xN4aevzndgf9Ev3TQhHQCnJIvlSINQAaC9h9CirDhdUVIULXdK
X-Received: by 2002:a17:90b:5845:b0:35f:c46f:2b0 with SMTP id 98e67ed59e1d1-36140473f70mr23188658a91.14.1776862287451;
        Wed, 22 Apr 2026 05:51:27 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141869e88sm16671011a91.1.2026.04.22.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:51:27 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v4 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Wed, 22 Apr 2026 18:21:15 +0530
Message-ID: <20260422125115.39219-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
References: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disregard my last reply, apologies for my mistake on the subject.

On Wed, 22 Apr 2026 15:38:36 +0300, Sakari Ailus wrote:
> This won't apply to my atomisp branch.

I see the issue, it's because of the indentation problem that happened becuase of my IDE.
Should i send a patch v5 with the indentation fixed right now?

Regards,
Debjeet

