Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A4E32A3C5
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769762661; cv=none; b=qjgXf1Y5aXSu5kD3uBxszWwfzQNIf1xtOpoJ5hM8sxol11JxMyI46DAKMH5lKJBM0aRU9SBaL1881azTN0OoIVzzyod7vKlfxmIJUrkqSYuBM/0W+y6ChWTVKVJGbeNcBZOlEyg9f/ugn9ibMj8PEO/flNHNUtOZpGRGN4thJ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769762661; c=relaxed/simple;
	bh=Se2TZEtd1mmElnC/ZfubyC1jOuxzf4V7hbuk2QTCVwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx1MB8sqJgtBemFycCo9EqnOaWrtQwODtNlyMU2t46CyU9r8eJnDMSLGhazRTP/llpp7+h4070bhvK243/XkpQlMXOYsAEfwpgBn/9/IE/Y3qxJM9stNNnTVLHOp0f+SY6OEgxb1eY0CAZc97Kzhe1ctqw0G2KMaHbCSWxnP7YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSLpkcCy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSLpkcCy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d256c2e6so1662059f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 00:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769762659; x=1770367459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BhdgDuWmGVX3Ii7iXI00D64FLe4zlVQ9D5T9rX3Mk2U=;
        b=oSLpkcCyWb7dBeW53bEzD0EYSXWZr+A2qdA3Oc4L6TihBmazsHaUCyedMzF7UzJlxW
         CfeTcZK7FDDD3Nccy/Cu6IeKZjfpRAKdUVYrFtIoFhBP8mbTvurBNQDS996e8fLWXqWl
         sKjakKtU5zM7nIWlZtjEHXZyt6xYP1vfzY1cNIgoXc14kyUtbuCgzxfsEjRLvNOdCJqU
         uAyrplXC9ZY+YSgwUNIZTmhIt1kTbC+LDkmiA0Nh+Rv1v5H77WUp1bCbdQgrCNYyO0gf
         W/h1fxTeUzXCUX6JrR8Vy2iJUlOpFrfR1I2c23FiYhiMd3D4DNDVLKy71Z4tLXePSalK
         SsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769762659; x=1770367459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhdgDuWmGVX3Ii7iXI00D64FLe4zlVQ9D5T9rX3Mk2U=;
        b=RPkR0QygRkH9cwEli2gfFMnT+ESEIfDYbxqYWfEezjpgaF8uC1lgUIXVsG0zCriTqN
         Z2ny1EOVRYWPscXT44QHeFfJuf5SZteEK7nrsq2/w00t+v9BZkpVg8LYTlaFzUNpXUNx
         m8rN6yHQz3mwkhKBQZa4a3z0WIUpM6MdmV7EFgsFlCI+dJC+KZKA89RQJufQX1atWmSX
         vo5/Z0gjcKCabfNuD5uFf3EqI3ee4Z8Brq+Tn2Zd6yYrDw3N9FY9Po2ZXr78UUqaRpnM
         3x1Mk6oOX43hdlXhy4HCZG7t4ZvwaG0zsrbpozb/lFtU11M2Xl7vlS5v6wRC2qIOF4hu
         M6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXEmOaKPKIycg4l2YMpxyHbRC3G18AMOwX5xti0D8BNgbeNdt8gEAqSCMSd4kqDlLLjXPkJGVQPAkd1UIir@lists.linux.dev
X-Gm-Message-State: AOJu0Yz68YkxXcmQghI7u9cT6JrkDtjxYvROhdohjoGWOE9ijVNDCVAo
	JLG1R42OicmEiN6pF/dmLu3TkoxZuuTS9I3/VMa71iZQebP9rCp565O+ZqwVH7FKaGM=
X-Gm-Gg: AZuq6aJbezTXolAs7t98KpdKZYAmALtBJxvp1TtTaqT8YOnHr+8tYUnhNCK/GTelfby
	WRn/Vl96fa0f1uPe/0HrOo/1gkhbEgJdD3q912tRQnrA/49m36ENU0GIUuEIbkKdX+1oNiUftWI
	d0uttaMHG0VaUkCc/Dm6J7NWz//2VX0wlLE+bjmzAJzyJXmJTCtKBVIxicrfhUw6RWpSOFALcvP
	VAvKDY1jvQWb2YlZbjpUzhjq+z+TqGFSlIJ0yMp0Pi75aQrSFmjPA4URL10BU7fqMNirj9Rroi9
	zpeesLeTF2MMt0B/bICGtVvZkOHGSLOXtIe91ZbebkXhi6M0/UcGx9vyavzSMVkzikU2zLWdFVC
	WB+od30vW5jxDOoBaJRvKRVYwaGTllWS+SOUPpH+FTFW81sAdbKJw2J9rtQhPJOyg/N8AntT6Q2
	/oGT2gyfE0Vm032TaP
X-Received: by 2002:a05:6000:428a:b0:431:32f:3140 with SMTP id ffacd0b85a97d-435f3a81d19mr3457102f8f.12.1769762658743;
        Fri, 30 Jan 2026 00:44:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfd4sm19785768f8f.25.2026.01.30.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:44:18 -0800 (PST)
Date: Fri, 30 Jan 2026 11:44:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/5] staging: rtl8723bs: fix potential out-of-bounds
 read in rtw_restruct_wmm_ie
Message-ID: <aXxvXqZeZSHoivFH@stanley.mountain>
References: <20260129181541.72066-1-lukagejak5@gmail.com>
 <20260129181541.72066-2-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129181541.72066-2-lukagejak5@gmail.com>

Please, slow down.  Only resend a patchset once per day.

On Thu, Jan 29, 2026 at 07:15:37PM +0100, Luka Gejak wrote:
> The current code checks 'i + 5 < in_len' at the end of
> the if statement.
> However, it accesses 'in_ie[i + 5]' before that check,
> which can lead to an out-of-bounds read.

The line breaks are weird looking.  You're putting a new line between
sentences and a blank line between paragraphs.  Just put a blank line
between paragraphs and delete the extra newline.

The out of bounds read is most likely going to be harmless.  Hopefully,
it would be detected and trigger a warning from the UBSan type tools.
Also if you got really unlucky and in_ie[] was at the end of a page
then it could cause a crash.

This bug is still definitely worth fixing.

> 
> Move the length check to the beginning of the conditional
> to ensure the index is within bounds before accessing the array.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> 
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Luka Gejak <lukagejak5@gmail.com>

Delete the blank lines in the S-o-b block.

regards,
dan carpenter

