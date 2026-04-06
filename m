Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D4938B7B6
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510604; cv=none; b=IREfgZ51ZgbDKXlBzavAbfDTivYKitrn2hvzfCv6ZPl1PTzm0Edsz6qS+AaSnDp06tLRTfIKpjsWX2alrvhKhFDPJAPa1QCxzUChrAyqUUU5G93EN3LR+Qi140uSyyqiL9qfu3wQz5u1+3ZfUtTE+px2beRwM1XFSbZ4a39UFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510604; c=relaxed/simple;
	bh=tX3o9f7nD1vUlJVRpS/dXcDlEK/tjAUp+SSuZzHNZTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6h6UrI0yfkKVEI+sjPHQMVownoHcY6owRsjw7Qvfb2axJ4owr+ZHnWMzA/1nwYlU7hPl46XJBTvSRdO4l0CpiMzgTkWo6McIvkYcYEN69Op6HB1Noj6I7xq/7/J8m8Tc/fPmlwdevzsVhGA88mb5bmvCmOG0AREcuqK4xfgAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdeK5c8E; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdeK5c8E"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38ccde812ecso42544661fa.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775510601; x=1776115401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6xJ/zDoOR7Os811YjMwToE+cggB6rQ02aG/lrQ8U/U=;
        b=cdeK5c8ExFheAPSZEbOKfFm9T+9NQBaNe7wNZ97vfHJmqZ8yA8cyd+7hiEfW/5+qxZ
         65RCfC3KtbGmnnyF0NXEaMUunIgPc6Q6yU+PxYVLq6fW0rUBJDd1rIsrSvlJjlKhaspl
         2PBVGLXBP6DmtyeisL9o0oaf6umWsHxrqCa18tnRTtw8uN3sltyaht5Q5mfMD7tjoZ9i
         hgSKK2M6Bepq+uRzHkg1jmd7OYU5eot8Fsn91G4dhriJUzfoh9eoiF1mp16w9l0QlWJo
         xa6BGiDdsQEtmxPJn/PBXD5KisqKjHoGxoIAcKf1J/Qg/93WpJJz6LRETpMtfspPx0Y0
         ObzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775510601; x=1776115401;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6xJ/zDoOR7Os811YjMwToE+cggB6rQ02aG/lrQ8U/U=;
        b=QB8Qxv+MhVtlt/0uq1nEVCzxvgpBV9T/NU1gOMzswf3yHS6rbUanfIDzwAm9npAFr8
         V8Lz0CieAxjEMku3gOo3N7l46CXjFOjKmLx9gDxhhPbTzU3TmpISvZLfsKYed3qcJzTe
         R/eqSwjFH9ZOkrH/vnvU+caR9S++SJvjC4vGoVo57X0rCYqMNHOShw1P9QIG1FRB+qge
         jPx0X3f+SDrIuNP14dsguXyjFKgjIaOIr/rSqyRXfYQimU0eYl7RFJ4bl0VkFFeElj5J
         7oCTdoyrDgDlU/CX0VKWHDvleoFp7I4dSgso8iqLD2zbwDg1z74vwNAB4Dxb+nn2xTz/
         +1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzIvVbJ5ViaAqWzC0OsGOgFuBvHKzSfooN3p5ve2HzbtAL824rjtsY1WJV+HSgwbV8kpVQ3eMIAATXEXu6@lists.linux.dev
X-Gm-Message-State: AOJu0YzQTPXorcQJIEIZZZN9OgYOczVFKSTuX0UfAmNuOaqy50xQej2A
	WyOmMWe5ccXuGINB7UzLKiO530WNRCMgKeEdVwO6qs4YQP1HPi/oZbYa
X-Gm-Gg: AeBDievAvNdiPb8WzLjIs05UqxZVRCp215Lu8QlGwVSnvZiVp4ZJYqSAHWTiKginxmt
	Z3GsQ142wJ65PdttPY2s80psEIBiDCmlRu8TRbZvkRrpqLlAJwmbpKAfbK31IhyTIWABbWlLog+
	r0+iT6uNmDD5CnFUj/tO+PIIAahJfSD7B/zI6gEdPl93eWpHK3UoDXyHxzKdb+HsMBBVQ1DM+l5
	WsFoP0R+X8q3NTaFEUwcSAIfHuMxYOrxGLSUunJXW5YKaCPwmDCmBz1fmBCd+roBFWb/evCBTyR
	4xOr4CbOBwOratwobXn54lKnkCqameop+0JAHsU8qG/13uMxYWxOtIBCY2pW+ceVb2Dn2ejSpV0
	sU77O539jm0kOjOoTXA4noTouOUkTfhKHWXQQGlvPY11/MN2xmQcqW0QtNNEH37NZmqRtlAt3t8
	l3ZGribtNM2Ui1inAZ9GJBp4tbIb4=
X-Received: by 2002:a05:651c:1a0a:b0:38a:3498:e2f5 with SMTP id 38308e7fff4ca-38cd6e4f078mr57915391fa.15.1775510600748;
        Mon, 06 Apr 2026 14:23:20 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fffb53sm32700151fa.16.2026.04.06.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:23:20 -0700 (PDT)
Date: Tue, 7 Apr 2026 00:23:19 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Message-ID: <adQkRxR9gmAPHnYI@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <ac5qhwdZLNe628eW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5qhwdZLNe628eW@stanley.mountain>

Hi,

On 26-04-02 16:09, Dan Carpenter wrote:
> On Wed, Apr 01, 2026 at 10:14:40PM +0300, Andrey Skvortsov wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > According to the documentation struct v4l2_fh has to be cleaned up with
> > v4l2_fh_exit() before being freed. [1]
> > 
> > 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html
> > 
> 
> I wish the commit message would say what the use visible effect of the
> bug is.  I looked at it and I don't think this patch hurts but I also
> didn't necessarily see a that the original code had a user visible bug.
> 
> I read the documentation but it wasn't as unambiguous as I'd prefer.
> 

Thank you for the review. Currently there is no visible
bug. v4l2_fh_exit() in this case only destroys mutex.
But it may change in the future, when v4l2_fh_init/v4l2_fh_exit will
be changed. I think the change maybe useful in this regard.

I'll describe this in the commit message in v2 and resend it separately from the
patch 2, that fixes actual problem. So this change may be skipped, if
maintainers think it's not worth to apply.

-- 
Best regards,
Andrey Skvortsov
