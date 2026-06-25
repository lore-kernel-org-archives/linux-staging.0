Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CEE276050
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383214; cv=none; b=cl5VZMryvZc088VmCSGhC1decVyzheJFayP82WZBcl9pXF7J82wrPsukzdG7kqlRQs0skvxDWuNEOQwmAvSiekV4SRm/cJaWT4EjbWDToXkS09/iVkkH6e+xr8MVtr2cM7TFNegzGJ37YYGHl5vsbYx+gaL7wgI/kDoDBi8s9+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383214; c=relaxed/simple;
	bh=AU5Hyl9Hn6l54+W2pWDrHIzyw5AWf6ORtaXgyteNaA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISK5UdabIihIJZUMR549X3YlpNg3jK75iPM8QMLDiy3UU+0G9c/E7H2KpDd8rTFGa19DfYjXFRLMXWDhDaGwk3bYix60I0AYrdQXc4Q3hdMrPRkMLhTksBMeeJqLRnvcu2744RoaCV5t6KgixYXQPoyN0biTaAGAwPJmlI9G1n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJiQjBZg; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJiQjBZg"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e94c26f9e0so874894a34.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383212; x=1782988012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpuUsGnvDm+QoXjPHw7swJUNLQqaW5CEgJOYVsc0Fz0=;
        b=BJiQjBZgMSzY4O0/SlitlEGZ2Fws/XePVETDJGtFrYC5C2HUBJx9UL+AQGP5wBmTFA
         hKtDWqkQhryC0vimSHABHzymdEG/YvhEY479Nil5RunPkgi4TrC1pSu5LaW9XEerHBQi
         OBT8AECB28pi0SEkWXfFyLc50BDeRxJHFD5FZtRb6MSi/47A3SUdluqMiB2hyTnA70QY
         lfH/2i92ZtbL/3vpKMI179+Jf8p6NvHpkELxN2JvEfy/TVO7K+LchQW1lpKIs3TSG526
         gEJNvWTP3LhKeL0Eks5t6nUWgJMqBVVQ9DJZ9oNeLBkZS+cejxdb1IQtqy8zpklBRZjB
         feFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383212; x=1782988012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpuUsGnvDm+QoXjPHw7swJUNLQqaW5CEgJOYVsc0Fz0=;
        b=LCZxFRqr+UxZOhqHQhIlVpDVwrXB1CPymhKlE8+cBP4oC2NW7pmyMTUF/YB/mxs9wi
         zXqq8T4SIosbNbrXOJjc4O5Om7RHd5SZtNEaO0xEXv6yLK3dY8OKquNoNeNnH9OF5Sf5
         jIGNa3TDpRDIu+C9e/NAv9DsUTO0vA8QJQ4qkYPBxB/ReT0g2o/PQ1cGsWswBdzxyela
         sVUNPWT5jqzfPKaUs0EzEYLpJ5QxTHazG77ifGzKPcLLW2zwGXLxMearb6tgabrmaC55
         +c/ulzJ72Q0q6udfgkREUcxsK7T5FptITMG/SVNIv0K2kZdXEgMnV0c+HC+BcPAFkpf+
         WVxg==
X-Forwarded-Encrypted: i=1; AFNElJ+5kEUxuRPePCOtXYB7pARV6Jr01B4xusrmu9pMHB0sIfhgh5lhTjHChtlcEL6Pe075hasnHDF545Uvq5XL@lists.linux.dev
X-Gm-Message-State: AOJu0YxL6mKxK9tUO/dzZ7dL1KTsFQ5mC2NIbSqdYOJKIpPYN46JgNh6
	yxi/wUZH+0W3QVeIxysbRUSWbIF/8dEgK91V/BHda4OCSd7w67UWjNxQ
X-Gm-Gg: AfdE7cnVY7Zvu+hSr07SoGYcaQx6FECJXgDIIE8f1f8J/R/A79uj6Yd9+Mjz+Yvp7F6
	ihRkagKoW0FsHZMQZDVWK6NhsuyBIR0ppbjpJswYfgfXfD96w5nPxPzacv19VIbOLRGvpPz79DN
	ATWobOZUvC9Bxyoc3OAovVrUDlpLfFrtxUi63impxv2B+CZb7Dg9JfwUyT6/RWJyVoAo7Hjj8m7
	Dg8I9JOl4Iil14VKjua8lDuYIwcL/hkios1KOahyNgkpyg7i3zh+kRwyzZItc0wfEbFg6kq9qiF
	7oRaolPI5eg2v7saAdUI1WJnP5uRCm16TSW/unNrD5Dp1C7enOI/DHghIHNXTZgvVU0U9vQclIc
	p1ZZGqvu9BHCuTXyGHWwiPXd0zNlFmR0QDE7M3soqbCmkpmgDO1oAT8eAlAoAxLZrdsDvvi3rsR
	jVaOLj
X-Received: by 2002:a05:6830:2685:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-7e99bf36cd5mr2313648a34.1.1782383212267;
        Thu, 25 Jun 2026 03:26:52 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e94429a5bdsm14319962a34.22.2026.06.25.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:26:51 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:26:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add comments to mutex declarations
Message-ID: <aj0CZOUlYlJydfPd@stanley.mountain>
References: <20260625085740.222486-1-suryasaimadhu369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625085740.222486-1-suryasaimadhu369@gmail.com>

On Thu, Jun 25, 2026 at 04:57:40PM +0800, suryasaimadhu wrote:
> Add comments to mutex members in gbaudio_codec_info struct
> to describe what each mutex protects, as recommended by checkpatch.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>

Capital letters?  Is this how you would write your name on a legal
document?

I kind of hate this checkpatch warning.  What I want is a document,
not part of sentence...  The document could go in the commit message
if you want, but I really want some thought to go into it, otherwise
it's sort of useless.

regards,
dan carpenter

