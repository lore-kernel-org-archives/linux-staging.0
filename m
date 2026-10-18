Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53574435A9E
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304568; cv=pass; b=s1XY3BzAdEyseuDtcqNHr6jO2exhnfq4nhFDKNr/roIA7iExHnyYgxNI/FbcpEql+iAgEPgu7WLuG94XuIPlklrNFL1gaGCLN73MC0f+fUqsFRm1Tgas5u/mJD1iyDpWjGVqbOsEZ/PYe5QnyQml5k1iplLPa8B63z29FD/tPUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304568; c=relaxed/simple;
	bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQXI6xtrTktNzNYTvBfStaAX6fPHBGAJ/aQeDiUlVBCwg8EPRw/GE25mQgDTb/z72jbIdYJiiRsm52+LMTWWucvtDPbz+AnbDYgdFga2juC0GZZQJrBuQGCZaLzkSmz3KiOGa85RzE7u9u8G6DM9Jg8L8cznrOlbQE6hHV7eKnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXVuc7Cl; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXVuc7Cl"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6faddda49e7so1135021eaf.3
        for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 23:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792304566; cv=none;
        d=google.com; s=arc-20260327;
        b=HKpQUKbsETWWWai20YnQmCjoaOo5pYVQDOhOa3H5JueySQKxnLT1o8HjhPg0kH+9vw
         Tjv6KQRVXKLOaanMIcYDR9akCJpJuL5klfi3UPyuFCApuOrR9Q2bkrTt0YjD7JjhTRUe
         duYMCJPyQ66SJD4PYPwKbo6lQM/3JYOKraDwR+ZWEmnHun2kagReNjLVmEq6z2d7grO1
         Z9RLw95yBv4sIjCcpkkypQV2cIfvv4O64QlCvqZRcMHsNKvlY+j5+rNtYs3ka31UzCd9
         cTKNBNFXW/I3mMtlF4ERdCanKer73XRHPGeic4XDfz0w6urlxPfS57sbvi1Wgb+AmJOD
         B3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
        fh=jbszKKCv0UtSEqSXa9YIkHT+4iIuJsXe0WRgkL9BrzE=;
        b=mhI77DO3cBpMr5F2Sgp6Ai3qWuw9TBlhewzPSmDZ7xB4flMCtjFES9bnzcLscIfOj/
         /bmT9aza4O/bpC/RDUiIET0wE+fBC8dytNAU+q919TzVDxr/FBHQlDp6uR5hdXpzGHzj
         pYQi0nBd64VdzA6HdiSKRXY932oY3qYnDzd2/UZxe90WBCJI1bpUNPdIPnMNeiBzubZR
         3Xo1dV6O0DE/Tw53HVvQCK4eSA+SRfmAHNyvzOStMl8oqqiIPp3W2S1WPNX9/9sguF5x
         iXj5v444iarFpFnd05KLHd5D8J01REKeSZA2d8LsBzrNC7ll4pkO75C9pupWuQl2gIbJ
         Rpug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792304566; x=1792909366; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
        b=BXVuc7ClipVpLeooANWZloSTpv0bsujfZ1AOSNw4fAiaxWxFG20OuAaqqDmEH97FaW
         5EHCwzTT9cfVfsGJ9H2i/VlfYXhyf3OV62TeRehssincsHIfqcDC275D+aPR1hA5hau7
         UFgHqXCEEAUnE9903HFq1t57pl/s8K9h8kpiz4UyCLAbkII3ySjkoDX+nDd58gg97C4Y
         wTGIo1gxcdoFgx5NFOUh2AvpDLEjpyLXcU663I7IOIV7owwA4xLHIfbZyQ+v5Ghn1XPm
         o2G5jvMzkumc18OHyOpHnpyIDFrCFhf2M3rKRZm9WsMaoZB4trENHZg6Z5n6GiAdWE8T
         VenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304566; x=1792909366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
        b=J9e1LF3RujHeN/aPNSmzY+LYHl+eRX2Jf1bFBXMRSfmzU38n1t43bcPYl3rOvqFtmj
         KAjy2jgCVXpIX/oPyOJgiS60XaHzvxoSNxTgfUVJdQYyRPaGeS9AFe8/AcR71rQC9b//
         Wb2iBqOqUQHTCsi96vIsYnBFCMELQUPmGj8lJpdi8LkU586FvEjBfWXl4ECfjiaQpp6A
         MIZRhM7tlJOmsNFwDg/ky4w3+gTUjVyW8KGBK79nnUVTAmMklWTAR12Kf0EBquYThrwg
         EGtikneF6WMOiJC48t1XFqKdY19Ev8DskzgtmLq5UwNj4uOi0C+uhaoJrGTWUz5BZk3y
         84pw==
X-Forwarded-Encrypted: i=1; AKwUvBwILKMj4xIr+3ldZ1zsmZ8jhhsfqaAHl4PAqw2vi75bGViz04DkxW1UWV93DcU7dzDVSXu+Mcr2hg1jOKle@lists.linux.dev
X-Gm-Message-State: AFq9FYJKfqG0J27BTUiBPpX4LtMEaYoy64AfSq5dVX5EbBxoTey0dFoI
	GcTnJHl9ou2QvvRMLprl7lcO6kqNdAlrZfKR6DSWOgXT9mk6j1FFX2HZ+QxLzhgOHs1GnYSsBkK
	vZzXpZdCpk/JwwN8pP/uX6a/4jE6DjgM=
X-Gm-Gg: AYBFou3remOn7noiwOcNwJCrT1wkn4zUZewGvdn4TFBVodlxJ7CJqn90vxwJ3+X1xAn
	pKV438okuYAyRIh1drXxqMg2OITNxutBNL942RsM4bSwnBwwRrkwg64kG7XQahHodgOrZVau30P
	YnKHGvkJaFlw9O12wVxIavi2z5LjUm77nYrg5TNuoRlmNNQluXb2bVpBuseJW3G2vbumObeYFkl
	aagaYrNBJApBL3gByGl8jicdDxVuXWMAEykGfZWCaHoRs9o9g0sXaez2dUD/ZXsQ6l8lQfuyiNO
	gFBS/bWN3jN8bQUXLBkG4D2JKki8wWWDWhXHuQnmLRa/J5+SPRVQBRK1
X-Received: by 2002:a05:6820:4b8d:b0:701:795:4eea with SMTP id
 006d021491bc7-70357495e00mr3531298eaf.62.1792304566146; Sat, 17 Oct 2026
 23:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014091111.20059-1-abdelnasserhussein11@gmail.com> <20261017231747.4906975c@jic23-hlaptop>
In-Reply-To: <20261017231747.4906975c@jic23-hlaptop>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Sun, 18 Oct 2026 09:22:35 +0300
X-Gm-Features: AclHuK_Ca_Uy-OZ7tfLlUzH9RqHtWG8Rwb9-cwyEYDkMviqvqgdGx4a3apmhzxQ
Message-ID: <CANpqX3YDqtqGeeqscxF0YqMWMmSB9fpkMbxapq8WbbZWSQH=EA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: iio: adt7316: use kstrtobool() for sysfs
 boolean parsing
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, u.kleine-koenig@baylibre.com, joshua.crofts1@gmail.com, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thank you for your feedback.

I apologize for the confusion regarding Joshua's tag. When Joshua
reviewed v1, he pointed out the necessary fixes and concluded with
"Otherwise LGTM." Therefore, I mistakenly assumed that I was required
to add a "Reviewed-by" tag for him in the next version to acknowledge
his review.

Thank you for clarifying this for me, and I hope it didn't cause too
much extra noise.

I also really appreciate your encouraging words about these small cleanups.

Best regards, Abdelnasser
