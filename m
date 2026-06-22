Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA5346E60
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154458; cv=none; b=h7ugJPkqN2qO/quam2e4UeLU7wNDgGcicjUzhudu4wtAuTM/RY9k+g7Vhp62nDz+aY3XfJLq7OgcVKEpGplN08Wb9MA4COqIEDmOaCj64JDOWm/tysnH9CyAjElM2OgT6fuGDoW/fyr6gZk9P93BDNR+XuIaFxAbJLOEg1JXz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154458; c=relaxed/simple;
	bh=2yOz5L0ZojVJ+eTT0+yy0nBIwlc8g6T+QbFpZcblDx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcAXZwmcfKGn6DcxB87pjJKBs+K4V1JPJDEth4orObHMUh+h6r9xQJVwNbghPv2+hKE5PIQuZYuk0QneAX+nqs6axsfwjPx+ffMmj4v5SLHdvGs71iPQIoocgSD1mauE4ZfnDok7lD+wNn8gj5/dp4GnMcZiIsxYuxlyfVaEbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf5qnb89; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf5qnb89"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso71302165e9.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154456; x=1782759256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yOz5L0ZojVJ+eTT0+yy0nBIwlc8g6T+QbFpZcblDx4=;
        b=Bf5qnb89a/MYeTN9lFvWnLUOi7OEHrpt/T+XlgWKzjYHXRZAe0MU3bCKIBAZsWF7dM
         simqBFydFUTf4nNvOVlQw9ZryV30Q1b3AIHCjJDQgd/bxSmSoc6hZfpA6IRHow03bONz
         pMmV65lfyjchWQFChvOj+unD5htHWhH77TvRyGqot1IHyU0e1nGv3KeX+7al42VkjUTG
         xdZ+uAKAAfUnviZgiiD9nlqRBS2V7edo5vs8hROyd2nPcRljLrHVaG9EiHKxnGkHfk89
         yihH4pfF82UakFdPX0P/HReRCf38+T69R1TD4KTbVhnW+ekJo2CB5rE2kPtvdGG0bWjQ
         fhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154456; x=1782759256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2yOz5L0ZojVJ+eTT0+yy0nBIwlc8g6T+QbFpZcblDx4=;
        b=XlSgGqnzHi0/ULtbHtasAMb4vZJdJvemta3lE67nMADlCeHnYWi2XRetO5nQ54XYlx
         fu2FjkI1Im6BJTdkkd1aodF/qsW4+5QP9dc5CzqQp7WN9zUVaKU0jxaYO56ZwuptE8Oe
         HrRRNdeR+HdVmouKoY3PzGHuSglvYtdButcIvB83mLntQGWuAYA9Qzkapc7+6s42YUw4
         D1FQTvXHHfKlXUwLOfwzoFp3Cqx6v0Zr89EXhWbrsBcAjnwLa9O7eJMvmGhKymVAxhMG
         GU3ztAzYLePqTp2ep8ek+ntonHdLDijcwrYOUbKBe9cOyhzG/NzIxPEifNHN85OVsYoz
         O2Yw==
X-Gm-Message-State: AOJu0YyZQC5qQkqn9zqsUUNSIPzftjQRUksxDA3IMiFgUuE1HeVoS0Li
	DL49CL+mbRfFIFDn78csmtFA9wsZi4nlFpTdhveN0F9OrYgD1XVCbA8vXFZbcxrn
X-Gm-Gg: AfdE7clCwgYEeDah+2P4lmsxtQ6iOgRynmv9qHPp/kubsE5l4JN5DNkkuH6seW9sGy8
	vaLiVY0RrfMabcpGZ46qQdwJ0IsYqgxu6o0Q2ddFgcyX0v5d38DMobu8W4AblmnrxB7EyxSVn1T
	SvoyJ3nA2HGnfO5lzt6yoK5B3K2El8+hRjQzl0Qwi2vsSxh8Owq0WV0g3jv4utqlsHAG3jf+Bvi
	fhcR/+QgGzZ4ijk5esQvZu8evbAmr5MHrHsassnGF6BvnQgoVZ/fLLbRX3ymrwUh8qTa3P6J5Hf
	Dm2El9JQ/OjmHg/fEMSC4CzFI7hd1Q8HGTh3uzoe/GO817pidgvKigTIZDdjpbKcT82HXnIZHEW
	coS3bZfl8UGyZRTUECQPNLKqzZ6EkjMfBi5sEd2mscGXvY9S+4PEG2Q1kcNlnGlxGMBL9KYKDcY
	Y/Thcrkw9bWw1egBfZlwVrFcbJqOnFNvlprWFXQN/zM95Bo9R4Zq6Ciy6+NRp9Ht4QgQ==
X-Received: by 2002:a05:600c:3e87:b0:492:46c2:f5b4 with SMTP id 5b1f17b1804b1-49246c2f68fmr225200865e9.32.1782154455574;
        Mon, 22 Jun 2026 11:54:15 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492492338dasm229097525e9.1.2026.06.22.11.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:54:15 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: linux-staging@lists.linux.dev
Cc: hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs instead of spaces
Date: Mon, 22 Jun 2026 21:54:10 +0300
Message-ID: <20260622185410.1336-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622184959.1668-1-batuadatutkun@gmail.com>
References: <20260622184959.1668-1-batuadatutkun@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I missed Shirin Kaul's earlier patch [1] which already fixes sp.c as part
of a broader cleanup of hive_isp_css_common/host. Please disregard this patch.

[1] https://lore.kernel.org/linux-staging/20260505193015.49262-1-shirin.kaul11@gmail.com/
