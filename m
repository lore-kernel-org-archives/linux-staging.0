Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF5C3B389D
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283327; cv=none; b=PTxIQNH5TuZBp5YeW8jascn5DRpqMDUpp4PX6BK1dBK0vEYX5dcFYQhECgi6EdjvS36I9BnaF2kYaZvmQDD0dVelEK4Rh5YxFqDxftkQoIW28xXxf98lFZlq767t+wMFwkHUz2mEqkPpQIk9g2wwDRFxyIvZgpyvMD0lrHZLgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283327; c=relaxed/simple;
	bh=NWHIH3ouqqjU28LIsZMEpIlQaONQR66hx99uHDySAWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aa9SliBw10n1DdRoe92XRpNkWg+ymcFBpKsvuv0lc4+QDN+BSMAmAQsmEghbp8iaKxCiT8VaXGWXvvp44nO6oMU8v9sQHX9mZeqCZkzZqzrLlVb0kf3P5Mvgx5+/yytd2qNRf9paU6ryHTbAow4kKqHHrJ5bJAnG5JedpjO9nbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4utpoLG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4utpoLG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso83554595e9.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777283323; x=1777888123; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+utIrc2QBhWvwYujurwn2Jgp1vdBp2MWfdaAw3dv8I=;
        b=K4utpoLGlYzyjRtfVrd+8XzVcxa6/aAf3raN2LOMuSXiEwrv6VW9w+ptnoudo/o+dW
         I79iEFVbadfeyKcF6usAj8yP5Ue3aEfF+k9V1bzti4KECB0sNdhYQyDgTUil6FUaQjz8
         ErDA1fdujhm8AjPxPZRIfBBlPcDNJbk85XqrBWtLMJC8Ncs5JCfzWXQbeFCWFzfV2RB2
         +NB2JdpVbONcQKCgicLFcTk8LL98c4OnseTEBT2gJehb57x57duSamEUERUL2fFVNR4J
         Al5wxNxErf452MtgstUt+AqGtkB27dceiYNF3byR7+Mt9TKvsbOKTpK+TM+k7ssmp+Bb
         YUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777283323; x=1777888123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+utIrc2QBhWvwYujurwn2Jgp1vdBp2MWfdaAw3dv8I=;
        b=Fu0KJIUqLbuwHKpD1C2ifQItstsW4+sIgND5c8vclQ+G2i96l/yqKES6x+onXWbYAx
         1L71kXASxlLVCmnMzMh0QS4gD9DviTw0zpotT9KTZQaKMlGs2z3NKSu9AIcxbkOmki9G
         r1p1phl8zwG6lndGc9sCUYsoyc9i9nGovUSFVrZm3o4SEWthBQw+DgRV9eXoDuXIJjb+
         TiMoTfTSpuKiSgcMuJAoKnv0qy6nnvsW93Jc+FAhrcFsGb0F3E2XeQCeKNb1zTW5exVG
         XYdosBSqZwINrW7oxh3p1JHrfpiXFYv71j/RRm2ZrAWCYrLFhkbh55cUVQS3jhC4/RES
         OVEw==
X-Forwarded-Encrypted: i=1; AFNElJ9gTanyQgXxogVUJ5cqGEn/vtGBa2rTHaberor86x9eSMlB9iT0xdiWyDQDcmkH5E/ecR90ERReBau9oWII@lists.linux.dev
X-Gm-Message-State: AOJu0YxpDbJY7lcEG6g8ZcXJF+TCd1bcO63bbz8q73fLGUDbZQLONDt+
	cDzd0ct1ZfVsM5y55DrLe6xuxAvMrkWcj3Q008+s21BImle7sVRY9/rV
X-Gm-Gg: AeBDiet9n2FDmFd/r/wfe6bxsLNeyiy6AARbXdXYQaS/S+tx2cGDyb0j3vKART84bRR
	JDt8qepDpgko5qmmI5rI1UUIQ3T7KBbX1vY+7Pa6Hrwc0MCQAqUGLxuwoeYZU4L+ORfmLcDf2/+
	e8SP/jVnsGvvhd+PVvpu+FdVAJN3xgV/z9RRFji1D9FqDRp8W0uGV4CZ4ow9nNvj/p0UbkIgHJY
	gbUJyZVkGrJqOgjDoIy0RRJ9HdGbTlwNBErLS7qR5xFuRtfWCCVBW3OBdW7B1v6xqYCPVaiexZ8
	JamrHHNo4ImupVwziWQjglPpR/fZqBUsQ+gqIDZx5xTw/JfFnhJAVph3wZHUM9p+Ko664oBW+WK
	X73/CHZyAb5qZsKUd5eeQyyArp3qcwuJzd1TyYIPXZyzmfL9sIpqBCBb/3zmUYffXuf7zwMDuZ3
	/HT0wuSgNbRg3BiWG2UpyLbLxxnFUCgQ==
X-Received: by 2002:a05:600c:450c:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-488fb768816mr586188275e9.14.1777283323221;
        Mon, 27 Apr 2026 02:48:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6124d7e7sm473159275e9.5.2026.04.27.02.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:48:42 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:48:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <ae8w9tkpM8G2NWWM@stanley.mountain>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
 <20260427081748.3407939-2-hossu.alexandru@gmail.com>
 <ae8pq5YzEe2wTJmx@stanley.mountain>
 <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>

On Mon, Apr 27, 2026 at 02:28:39AM -0700, Alexandru Hossu wrote:
> On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
> > We need a little change log here.  I was hoping you would provide
> > a link to the AI review in the changelog.
> 
> Hi Dan,
> 
> Sorry about the missing changelog, will add it in v3.
> 
> For the AI review link, I don't have a direct link to the bot output.
> What I know is from Greg's reply in the v1 thread on lore.kernel.org,

What about a link to the email on lore?

> where he said both his fix and mine would break things on some systems
> according to the review bot and asked me to use truncation instead.
> I went with min_t() specifically because he asked for it.
> 
> You're right that technically early return would have been strictly
> better than the original, the original was already writing out of
> bounds so it wasn't working to begin with. But since Greg asked for
> truncation I kept it that way.

This is the path of least resistance, but it's better to push back
on bad advice from AI.  Greg won't be offended.  And if he still
doesn't like after you push back then you can still do the min_t()
version.  Both versions are fine really, but I generally go with
the stricter one when it doesn't break anything that wasn't already
very broken.

Better to use umin() instead of min_t(), btw.

regards,
dan carpenter

