Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706330FC1B
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485908; cv=none; b=I7yFSDElfuT8jTsSnfsFSmueWjVlnN1GyiPFWx790u69UDt4OnD+Hv8C8B+PaFjsheIeCsUhjY39kDLjds8BDQu58F9aE+Q9QZPWo9iidKbuX9W6KpQckFtPUuYgwPNa5P4DlDSOHRdl8NppUjVUcR97VYEe4MSQwMDVcJeJqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485908; c=relaxed/simple;
	bh=Qt1z8DWdfxc0Fqk7WcK4T9qBiKtmLR8z4f+GsVxp0Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOJrB0UZvmKHghS7dzhKbRPUKFcWt7jLFlicHTYqHa0NgTZyDUMw0Q0o8h+l99WSXoIZCM9Cipw9c4FQLkZ+heQexwXxzqQJCsV7lk2wI2yzVF4XS55Y9oInQwCkGi6GIeBd3RPKiWeyXvPjMh9r4v+mjoDRT2xF/a4Ai/JP4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7ASLPiv; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7ASLPiv"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-7ea6923cc94so6384557b3.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780485906; x=1781090706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9LboitBmJDeKZ4FzvkUznHW0mYwQyqZQKW0C0dXa98=;
        b=R7ASLPivlhGVw+LGWhDb4BxxUVnurJOEBYwWuo8hPGbRBEa0ysSdBurLblM4gAQXbi
         VTECrpXQyXaAfLZosqrTnT7VG5Vc4NHfI6ffCu7Ra9IxqWpNpAsu+jj8zK0ayXtN/vyX
         lC6VKGvf2lxo2mjC7r5d02UZcZaNnUb+xP/rVNynzsqQFcE9xNLL+WAECJAFCeKEDDKD
         bU/w4SDdLTksnwnHXFwGER7KX0fIh1rYFKUi3NFEVA+BZ25Bwyaa6M3hREPaFLMz1Gi/
         3mnb8sLfRbGGWJERTaL6vn8v8nfDwMOU6tsNkVxJR7oBDxTGoGSGT5TmKPQMtRAWGPBZ
         5lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485906; x=1781090706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9LboitBmJDeKZ4FzvkUznHW0mYwQyqZQKW0C0dXa98=;
        b=IEbGvzPWHRbozyzJj3SST34xmM8fCaqKsaplSTJiMBztzpazalFByiqCZ5rVDJmxz2
         ysvr10FF1v17GtDT9Ssff4TLgoSK1Be+UGGUoAst19ZZnfVTIGyvVnls4iAgu9glscC6
         URGiEzUboywvgPe4niuMU/W2h0uMTWoP06sqcKRGHAQ8UY6icFEeiFSwjVBnSDU260iH
         6VqUS6rXN3XoDH/CU3p5vbwrEK0kRIaCtipxs+dU6x9P/FHWbxM7QXZnk3vR5iIU1gF4
         lUc6+ElmshemnzK/sMB2neptxGzWWXmzFH8t3apExI9vAVdTHOxdUxQbzfLUGm41rgww
         r4RQ==
X-Forwarded-Encrypted: i=1; AFNElJ949tGXY3wLMYpLufCyhbqWBYp/ihsvBRPw3C0vBSZq6BeFS+0jjgVXY3vD4M/a72S/O1Xn5jeaeKYxN3eQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+UtgbaFe1bcZ+Pe3IKrwU+nEBC3WsaLbcmJwQmowhXQBLMgB8
	GG4pRrhVFJssf4A31jEYXepaYaSr41umRGrYiHECdz/FPLm8EHXnxcJx
X-Gm-Gg: Acq92OGifwlpsa/XXigS8mUvZUy2lwU3X++EJvjMdiOVNDZ1IAz5TlZ35jTnBbR72lO
	nvFZvkC8aPM85H6W56BcfAYioar0a+fnA8oy49VDtyFPdLNwXdypzdYDQtrXcepTGFWK0zIbO/M
	8vOjTSMiushqepnZ9NhxtAvUzVouZlGqvPawtO8b0BN6o5B4oq3o7zMk7Cx7/tuZyvVmebLmI3P
	XcV+glpQfkz7nyCf99TwPFe/jZM0qjiJig5fuXYTCMEf8jWeIruQ7OiMBQWzH9YpzcVSFSDbKS6
	UhcWm7WuyP3e4F34OIb400zky9GNApklJm8qXb0J3qtCELiZF1yOcmc8uAiITEMR+RYX8XjTyGh
	53i846d8KQGjZAgTGaVC+i90E+WvHqk2PhkgbMm75Va93mts5gsAxU99cSOPegDoSGo08ixNi0S
	H8Exxv6OYEW7H7DYYNKW7+Z1c1HH0=
X-Received: by 2002:a05:690c:660a:b0:7dc:c934:dbc0 with SMTP id 00721157ae682-7ea486cfb5emr27939267b3.20.1780485905964;
        Wed, 03 Jun 2026 04:25:05 -0700 (PDT)
Received: from hp ([2600:6c64:553f:f68a:e071:3df5:f6ba:868d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea23a97729sm14199877b3.36.2026.06.03.04.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:25:05 -0700 (PDT)
Date: Wed, 3 Jun 2026 07:25:03 -0400
From: Marlon Trujillo <marl0rd1080@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix typo in rx.c
Message-ID: <aiAPD4BakIF9ctYF@hp>
References: <20260523111511.865-1-marl0rd1080@gmail.com>
 <CAHp75Vc913Dgo_fzqBGZBaPB03De7V41dwd4uLpw9gvUe-+JDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc913Dgo_fzqBGZBaPB03De7V41dwd4uLpw9gvUe-+JDQ@mail.gmail.com>

On Wed, May 27, 2026 at 07:32:30AM +0200, Andy Shevchenko wrote:
> Is this the only one single typo in the whole driver?

No, I took a closer look and found multiple similar typos across
the driver.

> 
> But before doing that, invest your time into reading linux-media@

Thanks, that was helpful. I checked the linux-media archives and
noticed others have already been sending similar typo and comment
style fixes as well.

Given that, I can scan for additional typos and fix them together
with their surrounding comment blocks.

Would you prefer a v2 of this patch, or a separate cleanup patch
(or small series) covering these fixes?

Thanks,
Marlon
