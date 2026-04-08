Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DEF33ADB9
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655787; cv=none; b=s9QyeTic4PdhQE7S3XdfDzyGQOwHeo64uWywQIu5/h2M9fou+BdoBdBUHyJIJJas4Ho4JO1KVwGT/TEkXfPSjMgNpVSrGZ8rewNRvEU4KSE1BEMieEjRcznEPhItNZuLK3X+YpkIavS0sXX+RZrMpZbVpt21+lvFrtwasqASUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655787; c=relaxed/simple;
	bh=Ip/ecwNubDqLmJMleabmXHAK/8+ZPzST0M2Luh3yUIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKcpAJVo/ET6F3IF3CNCQ5cKljz1NLJT0AdDcgXWRpo0kzYwA0xd9+sPhIDYbWK7pyy7tWRYKSaCpxWaRwPzcPscZgTb+k7Mq0f7AUQ8nJRUe9APXpfkV+b+SN7DDrKmsKUlL4g3IwVXPKsvUIK/PLucaL4jLgk4BB/LnnyFM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l965oPG/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l965oPG/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso11115955e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 06:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775655785; x=1776260585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfX6vEPgTKMdUYQyvcdtf1D9EG80EL+3vKPp1rPUYPg=;
        b=l965oPG/LFDPuqRXfyIkdRgiE1J6oMjjRF2VHrJk91CZzdfnTNoFg9ZRyfRsf17WI5
         11ahAifuFQO75GsxFlxVYM8mh5qNrDFnmwonj5a8a0/Py9GheNFYJ49zF+m/JzvMVZ+Z
         HWRURnR32TsJ7xwrUtBQnBgKgDuqz5gziWD6VoEKeeaI46lFaceVWjQE4clpopYsfrC2
         AoB3FaZRfUVkHH1Jqo9fRlnJHWKCs3lIkKGyhza1VEA+B4wWk9ehZFRQVQTcVGFOgU95
         1ZxfgBT6l5RsK04283jMoi2hKND8kW2g5JgLV/HN9g8zwtnuXI47WDaAAJ6dYyg2W/3m
         71tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775655785; x=1776260585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfX6vEPgTKMdUYQyvcdtf1D9EG80EL+3vKPp1rPUYPg=;
        b=l3/6f2V14kbKfZ/GjQLi436LYFPaePR85wb/5qCCU1hOjkp3Zm2WpdY0fbzz7wh0K+
         ZhtjndFRmbOW9vq0yul0D2k5F8Bq0BecmCdngy+ouLfBbGmtmPpGBSb1ZoNER+/MS88D
         m5R00WvqFLwWnzVwdLeWeVIqzzqJDHZtcXiPX2PkN9b1Bu/S+dWg/gkV8zrqFvk1mlhX
         FRQ8C1e5Ld0FNrroLD7rncjyHoryrpVZq8n/Kx27rDaXASwA1/a5LP+43YID5jjmaMS0
         GqntG9shYiv37OFkwskWYUWaGsOQQvkIeXAiL/rJRVXqGRglJBsWL7eOmk7HBcW81Yt+
         +s6A==
X-Forwarded-Encrypted: i=1; AJvYcCUBCSPv7p0hUJFjXS+ganYhaWHb8qV+seZyTXe9wUOTOclswgC+Q0jhjiWDcLkoaURMvDj0V0dnMbWLcos/@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/EL37ScY4Nci3H7MQcq148IxLMNuIKS+Fjdjb7uhhplvL7V6S
	BC5eIeu6MYExo7LMcIL5ZTSOv0dtRlya7+UMrBjmgbrToPizTRE4TYtE
X-Gm-Gg: AeBDietXddHjIHVTzgva+CsUZ7Mk2oqauXNAXnNSE7M0KfqKvNWWkCRm3kx0TU+9T66
	sw8y6QQIp56tip71sw2BHLUAdjFM6jyqE5hsna+Ofij6wNVWgk50X9XWo1kBtui8WfTHCRLLPbt
	nJAhXJtCmM8iPigLW8X3JKG/ONwJ6SRa99pctgRpcY1EtlqAUJpt0P/Z888lRbC/0KWEC1+X7M5
	yS53BbIaeBOi4HBw8O5DJZJRbiewNFSViIQyFhPcE3Zs9dVXR6W/5BTEJJtF/ZcGl/BWbsc/uCU
	e1qFR702JAu8Dx4Ht8SpqD4r+ManoW8fSo/GpYMkQ73uJadyqnwB8xT80qFAtYJ3x5n8Z+nMI+d
	g0vauXVwId4Ilho8h5jz3r91ybcmtGBuUjMpzOuz1D1N90Sg/b/tFz9ghyxptSJ+Er4ekBJDP7w
	xpfbim0DuNLWoaU7yBENV3QduOWca8monYXfD0JwsjRqE4VSUfpJZ4
X-Received: by 2002:a05:600c:4f87:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488994a77b1mr268030125e9.12.1775655784526;
        Wed, 08 Apr 2026 06:43:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:d997:3078:a4d3:4f51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm1191538485e9.2.2026.04.08.06.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:43:03 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: video: replace BUG_ON() with pr_warn() in comp_exit()
Date: Wed,  8 Apr 2026 14:43:01 +0100
Message-Id: <20260408134301.78474-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <2026040838-washbowl-handbrake-ae03@gregkh>
References: <2026040838-washbowl-handbrake-ae03@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Apr 08, 2026 at 01:51:59PM +0200, Greg Kroah-Hartman wrote:
> How can this ever happen?  Why not fix that to ensure it can never
> happen, and then this check can just be removed entirely?

Thanks for the review, Greg.

I looked at most_deregister_component() in core.c — it already calls
disconnect_channel() for every linked channel via bus_for_each_dev().
So the manual cleanup loop in comp_exit() and the comment saying
"mostcore currently doesn't call disconnect_channel()" are outdated.

For v3 I plan to remove the manual cleanup loop, the stale comment,
and the BUG_ON entirely — leaving comp_exit() to just call
most_deregister_configfs_subsys() and most_deregister_component(),
which already handles the full teardown.

Does that match what you had in mind?

Gabriel
