Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D06156236
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658464; cv=none; b=BgV1Yr3iDCThNe2+XAbUA5msmxXfOQU3uoHqCe++kUy6v81uS7hi6cf9N8M9MDFVrNUeU1bhJTIOTeyI5sJvcZw1czSgf8cvDusWWQOuODnmh8f6r7qapiV2uYEqun8ZIF1G9CZ+FDElBrGs/ViQ52pceoUb5JkblWujCzShhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658464; c=relaxed/simple;
	bh=ZWvlEKrL3keG/czpO6zUsgNhEXBnOerwPZIVy4wx/cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEYoO7PFYTSZZAUelKTQC1u7xMwbfBRhL/MyshBY/CWO5i8NgJFwzq6W2SLrEHoW04etVYe1m+6q+H9dOg8Ief42T4sG6iuHLG0KvCTcVvgNu0e8bbW4grnwJVI2Nr91UEieZZHKt8ZV0YWgCuzg7YtcfQYnzxLRKRFa/iFWJWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdBfcfL0; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdBfcfL0"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6dea30465aso3999322276.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 12:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658461; x=1745263261; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=obROj9OHt/C3Qb4hnrNCME/v4kiPzy4k+fmQTcyUCNU=;
        b=OdBfcfL08S8oWAJLF8OY8XwGEI6bPcxUogLCBqrRe/DFEz30csKWoeDEg6Swe6SwT/
         e7/gBZ3d7wY589BITdlZHx0Iqnok12ncKk/kiUGY8+b5eQcAGSg6G/hSHvF8ZmEahgBm
         tdPo0qZUFABb3qPL45TX4pa94wQkPxMJL9/nstBn+WGg6zbBdCt6s5kqJlfl4+oPEDm+
         b4GLKhNMMsQ6ZxgDKD5/dMOB9OWlu1MNXfJS3j7x0gQYwcy6MbJYVo5f+RTMlgK5fnaY
         sVwV4ZYtUgi9K4Bl1pPuxSs+9WTmuE9j6qQrlLr2puH3Fv7lPn9wRnKI+m8EJUhzGFNa
         Wr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658461; x=1745263261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obROj9OHt/C3Qb4hnrNCME/v4kiPzy4k+fmQTcyUCNU=;
        b=ixFvnhxiBdDdYXo57yogJyngfG8ayvZlH2d5kGkOqYM7liOJeslyEYbATWfyzgsnld
         nalzcDR6NBTBBH09eKOkNXt952Y3pjaa3osIXN2k+R4qEMpFvaq46S+VhZk7TFBQU+Cn
         5J4wikXq7HSShgPnuNP7CxLqFKNwZlnSF/kzrUKgZfhV9njBmkDyVKDAL7MCnZxC+tmy
         fKUfKS83AFAfczrZq2bbntf07azV6gk/HxSGAbLvD/fs4tkZ37uskWbRBYk1ezgmaBpn
         VKRw3CkhU8KKOOzIQHGfyOMIB0XqeZcJevJ8cwRXOber/wQxWZ8+7BGRe/+cC3ja9La9
         192w==
X-Forwarded-Encrypted: i=1; AJvYcCVdGoEKmBjV2g3jam583mYoe0bwdYdIvdjx1c3gvTtUr7TZYKFpAKzZXCS2xeYQgvMT32CS2c3jS0/Cwodx@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3f7aUWCDSsvHhBhg1oCu4D/NCo7AhduSD1SREAo2aENBO0CAf
	+3UG/bueMQYDDKCn0cPEVES4ga+6zHKUmqsZ+esnUPIyXdJoIittN61ZTY/T3dKNAjglRzKWiap
	4VAO9KmKueRcgy6q/A3ILcYsbfq0=
X-Gm-Gg: ASbGncvtLohCWeMAz0S+kLrC9t2aWtaP2ozfNh3D/4rRAnR7MqAQGL2K+HENsXwfc2c
	NEUU7BGD1/aGhnAs4JI5CE3HLRvRmYr7XVMb9YSVxDYTaemx3FEWEnAXG7e8uO4MGrX+nqq53J1
	JpUK4EbtIhA5OrskaE87nXE1mIbrY10gR7ylYPo3Ge23BTc2fn/x+j/Q8=
X-Google-Smtp-Source: AGHT+IEnbonKkHcOHThRgC95LZa7xC/Euul+fsvazRpNbLbkH50sySzeaHKVSyOmpmCfjkNpaGXp0GdDATuH5Y7sCpU=
X-Received: by 2002:a05:6902:228d:b0:e60:87a0:61fd with SMTP id
 3f1490d57ef6-e704df189e3mr22532632276.6.1744658461378; Mon, 14 Apr 2025
 12:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414164811.36879-1-simeddon@gmail.com> <20250414200312.0b9eeb10@jic23-huawei>
In-Reply-To: <20250414200312.0b9eeb10@jic23-huawei>
From: Siddharth Menon <simeddon@gmail.com>
Date: Tue, 15 Apr 2025 00:50:25 +0530
X-Gm-Features: ATxdqUGTyxPuItWpG94bKrM6IKeqvpWTAaXqlM58GxhgXVO_PIp7E8GKaG5kvrQ
Message-ID: <CAGd6pzOF1LqN0w2WEhaGx41mxPNkkD7E9DQNQWSZEzjyuyuYpQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: iio: Document ad9832 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	Michael.Hennerich@analog.com, lars@metafoo.de, marcelo.schmitt1@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 00:33, Jonathan Cameron <jic23@kernel.org> wrote:
> Hi Siddharth,
>
> Whilst I'm fine with better documentation, I'm not keen to merge if for
> a staging driver until we have that cleaned up and moved out of staging.
>
> Anyhow, that doesn't stop us reviewing what you have here!
>
> My main comment is that we should be focusing on what is useful to someone
> reading the kernel docs rather than providing detailed description of the
> device.  If anyone has one of these and wants to know more they can
> get the data sheet.  As such most of what you have here is a case
> of too much information.
>
> Jonathan

Thank you for the feedback. I'll keep in mind for future reference.

Regards,
Siddharth Menon
