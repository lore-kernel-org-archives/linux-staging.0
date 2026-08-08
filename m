Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01942381AE0
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 16:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207187; cv=none; b=io2vzop7yxzKY6H8K8Djb3JKdHd0uM+/fMy/cGefxouf228sF9nKRYM6vEQMpJH1o10MNsJ5f4NWrwo46nHgq/bYk4vZAvUEqi0LnFtv+3UbcptiC9sHCzqU/mfCv95fsQfnQwB2ka2SRa5ZrtRc0YY52DUHoA6K1byUZPYqGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207187; c=relaxed/simple;
	bh=OZT51qHrYgQnWWXcqf3U4YiUd+vws/gvgF5A+hfVeak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c+6EO67EXLdxnykp/rfDKiANga4xjjjUl2kyaRGa8wPzdYckZlLwhUcMffN/H7taY98ROFVyXvuDeh4P0fd+N8h5brd88Wx/uOs/ayn9kCu7jVN5L7pJmehhi1nGttE2GzflkErdiS2XqPrej1VMFg4gxEadGBPUs8EmH5M9fXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgoMvWFb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgoMvWFb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2074710751so68400566b.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786207184; x=1786811984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZT51qHrYgQnWWXcqf3U4YiUd+vws/gvgF5A+hfVeak=;
        b=JgoMvWFbbSWX6bN009NapT2rpLKdigVPZLDSxXjwbQUKmqA0vb+21dzOHLs/UUsM2d
         lRtJQsffKFaGwNmO90UMTA0eqstVj4uLaSOapjb2gpo2AnPhBNhaAxWJ7cT9WQOjGc9F
         i7qoqko2ulOn6/118Qd7sRWCfeP2AQQZNxqopCHv5OzHsKIQPhv1RhEhxu6rO7GjZECm
         oDr/K11oZDfLTItg7FZ6Smpme5WZa+6dP0Sf2nqzuaz/ZZWU6g/dS0/F0oRDlwWqwAPC
         fIWjoxoF1nWhH3Q7aNwLYkVxc4b9NI1rG9LgpYgOiaH+q+r3EdPEeSBkVSC79S0Iwmna
         Gkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786207184; x=1786811984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZT51qHrYgQnWWXcqf3U4YiUd+vws/gvgF5A+hfVeak=;
        b=hHfMD5brb4fEXykrS3OJ9fI38+ja7wp0fEEUJUkThRMU6/4jAogBZ5qOfjf+2QmFWI
         E+mqMDg+8xg3qPc/10v2o2rOS+80EP9QGt2WC0tK8/TRvC/mKirXzeIbtCS2T0t9KZdY
         oly71t6QUBLTaCYAJVtgtizZMz0uSLn0nOwc9N9l+75+T8MXrBSVLM90S1B6MEbbnjMl
         l85AdJEoNrAxx0M4DLiGONH6oZrQ/wilvvK8t6FD6xXAv+TTf8qYaJvFhiEtkhrpkgXQ
         JT7WPS+npVrJhxFhLPpfBCYCKNK+u3Y5mzUBANi2bR0TCuFaSAIgeICF7J31VYc8cs3D
         t2AQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJqY+NeHxaWIOrva/OtWk5Cfny3ntiKqLCVp2X/QoJ5DoTzGhwOKaE1NwOqcBdBWbtWpLRDRi20flIz8qR@lists.linux.dev
X-Gm-Message-State: AOJu0YzTouJGZUOvQZVXHAOhSICY0I8onRXkXusiSeVEfPIslyidAUft
	9Au1kXyt6FRC46ObN0+gaIf6qJizRPqFIm5+O05fX/bVGXWk1iMTvrnk
X-Gm-Gg: AR+sD10s9CNYMV9ZixsDlEY1pYXLYQZJ1BWt2riHweUo2Zn6iB+wG0qNWuDRodePK61
	Y6cIg5MTvfytps8c4Bu4wUt3+ygkYJJgq9KN3XvipIGGhue1MbH0LnVO+NCMw/iV5JQAuOMUzpV
	zpGwEneZy4wnnCbp8XPJgBn19JAaEVG1rhmVpXgWbJTP5RT8/Q8JKCMUd7dzBp+bwA7lcYhFfur
	cWmBuvASxhJ92irYRFRz2tyupBt6Mt+Fp1xllYtldK0x/Z36bP6bgL3ktlH+avOmEhwpAm5jdJ0
	YCFsA8mum1xKJ91IEPOmbStshNv/LQQuVtwjVxnAxmoOchv0/HPmaD+mmsZtu308LWgzGlLiVru
	sEJfJdWqByzR44L/iBXts540fNiursBsU30udZvj7iaI7VGw54L+s94caBsCNv/5qaRIXkPRyuH
	5DR3/thOCR5ZEedk78h466knSRqhoptppuYqQ+zg==
X-Received: by 2002:a17:907:a41:b0:c20:31d1:a89f with SMTP id a640c23a62f3a-c2039cb1675mr1455668366b.24.1786207183880;
        Sat, 08 Aug 2026 09:39:43 -0700 (PDT)
Received: from localhost ([2a00:7c80:0:3c2::13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90eccsm183588966b.40.2026.08.08.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 09:39:42 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: hverkuil+cisco@kernel.org
Cc: andrem.33333@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH] media: av7110: refactor deeply nested PTS loops
Date: Sat,  8 Aug 2026 13:39:36 -0300
Message-ID: <20260808163937.17504-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4a9b9842-8d51-4ddc-9b24-b69440091345@kernel.org>
References: <4a9b9842-8d51-4ddc-9b24-b69440091345@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks, Hans. I agree. I'll keep the code as-is.

Regards,
André
