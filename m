Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95DE3AE19F
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280444; cv=none; b=S9mDIB7SQrv3yDzqpYhfTrroTDwCHBCCEFIU6cQucFO6V9rSPNQdxSimfCY69u0mawIrzMYWTP7ub1dhOAMGt/9sqewGUhK+qzjMweYYviLrHcXE+4ULbPBwsNqKwULe5+KTo6wXoK7P5kMPXDH/FgINk2Vav9vxDL8a/RjB57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280444; c=relaxed/simple;
	bh=5ITOg6EqoWqXlZntp1Gld4HRcnn+N8uuRj9oXYJFars=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cR+iGcPgrS7X+5w/PL+ibL7X0I8SJcuvcvIygXI+dwZm51ukharHcQJdO3aLe0eHQ5QrwEGxOPco5znA96nwT7HBQlzq6MakRV/hccxWg/MdfI5s4qJzaW2qt972MDDNxQJEyyWasKoKueVS5eniWM1c7GubXxh7QxJ4Ot+InGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZ4CIEqz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZ4CIEqz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso81300875e9.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777280441; x=1777885241; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7NAZlpKXzIndoIBQKSD2JPSIiZtdTLAwhYTzEj9A5o=;
        b=RZ4CIEqzQpVLGs3gAMPH7FJLmawWKGK3phU+SbkDl7neRY0mS8DbZRy5hH+mjsecv3
         yYos62FjcmB3pPLwatRLqtyNH3M3CfXuHN4DwimULKT5vlilKpb+yGlezvDJrx0RVwzE
         VXhXsaLlUaAew52ui39oVtUYrg1sLrvvawAmlFNsoUSZYwSUvJra3bjqqPLbak5DILpe
         1XA/SZ8V3h9dQ3MA+QEAJ90Sb2ZkF6L3zb+WgGtfdnMgTdrJIwTLpN3VzGZzjnGqOJRY
         yQtV9TKNxZ7F8wQzfhV8KbpfPvIPownURnWfBNvzoIFwCiA6MT2DoYvjI85j3qRN7y0S
         F8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280441; x=1777885241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7NAZlpKXzIndoIBQKSD2JPSIiZtdTLAwhYTzEj9A5o=;
        b=H2wBs+Z9FaH7ebqp9xex20NtoU98KiRY1VDUPy3aE0sCRKZWx8rSkUBKK1iX+KbRt/
         4Yz4yJd4I1Vj4HYl91NMUzCL/Ka9PlBKo7HRMKG4MKDzlzfXV5klwXN+JZdI84/oZ8og
         5JRsKfav8lzY6YfGgPwafSQ+HXUFFfFj7k+79XIhORG9wNjai8sEMGozW70IiGHNMDwZ
         0J4ey2uqjwgjpR3Nu7WhdLLbmVJJFg0U3BKNhQd49B3rhROcwOBSEK9KoWbZ9f2W42xY
         Mn9jlfrHpOah9UWrY5PY2kQK42SjUzBSLukycb+65SXPshu3fPEh61CoIu+15Kn5J7wZ
         lxPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uWeWWlxJuA898qGOijroXbGPnWzH7QlkGCYiOLo03sZWSEpJYDzSXRD99lFcluMhuZ4blq/btbysU8Ez+@lists.linux.dev
X-Gm-Message-State: AOJu0YxBnXLPfknvKhQyekrlZWsMMrnx7onRvrKXfFi+jN1am9YJxkl2
	oX0rZ85MF8HXciQBtt2CaQgZKQyTbAlcxUKBUKAR9LS1Avr0yysNzjpN
X-Gm-Gg: AeBDiet0nIDWFjHU6hYU80U46wA8TD4XF2WjKyDUxeSEJIuzALmTu6x/DTtucfzW5NH
	VXeiBAKC5K/k7uv2mcPTm2yG+Y0sKRLD9jro7/iBCnYzyXNchN/W0k2pXDmka360ZH7tnXTDVl5
	/wtll6Y+y5+dTRToRqm1iPEZ0G8vmmHiL7xyM7SqmS3U/nJaq4009ctaFBsKdQunpZNHpklekiC
	kYjXLZhLsEmT+/FIYINABGohEIgwBzbuQl/3xW8HyApIr631qqcB4WjOBxT7jeH3DNNFNFdvBF5
	BhpD16Em/9M/IyEfMQyBBUCWxu/3tmBEfzayAGHo6lxqTmaCTs/2TKEFy8HrFiQchdWaOS7wQzh
	lBU2FHL7wadF8lpjrIe7uExYVuHsAInKK8morIsuXV54NOmyym+Nj4izNKmEZHqYH/mPbz0FizC
	clysyEpbflN0UEObdnS/AA4Q0EmrvtGg==
X-Received: by 2002:a05:600c:6085:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-488fb782618mr541683735e9.21.1777280436814;
        Mon, 27 Apr 2026 02:00:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm76856446f8f.33.2026.04.27.02.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:00:36 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:00:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, tsbogend@alpha.franken.de,
	len.bao@gmx.us, yoelvisoliveros@gmail.com,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: octeon: remove SPI, POW, and PKO typedef
 enums
Message-ID: <ae8lsN42HSBWZPiB@stanley.mountain>
References: <20260418230344.44242-1-m32285159@gmail.com>
 <2026042615-ambulance-upright-3041@gregkh>
 <CAKqfh0HJtz+hjJGMcDGQDQeUQDP2u5JdPh8YVwV=Q0MWhs2tTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKqfh0HJtz+hjJGMcDGQDQeUQDP2u5JdPh8YVwV=Q0MWhs2tTw@mail.gmail.com>

On Sun, Apr 26, 2026 at 11:46:27PM -0500, Maxwell Doose wrote:
> Hi Greg,
> 
> On Sun, Apr 26, 2026 at 10:50 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > How was this tested given that the previous ones all were not?
> >
> 
> What ended up happening was when I did my test compilation, I'd
> forgotten to compile the arch/mips half of the driver. The test bot
> obviously then caught that and it ended up being fixed. It's also
> important to keep in mind that this is (or was, rather) my first
> *ever* patch, I hadn't learned all of the tools of the kernel yet. I'm
> almost certain that this revision is sound, as the test bot hasn't
> reported any errors or warnings, and Dan Carpenter hasn't asked for
> any naming changes.

I don't care about the naming so long as you don't have two enums
with the same name where one ends in _e (which stands for enum).
But I also haven't looked at this code at all.

regards,
dan carpenter

