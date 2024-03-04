Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383DD171C7
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540946; cv=none; b=KuSXlVJB7+BVMCdUYZpxpqC8A49p1N0dyULZQ/63ENnWwbl6WWaxltEVpIxQZ/SekeJeV7jOsE8rE5L4+NT3ztPJz4rS+ZJUrLZGHgFoJL4nPb+vz5PcngTKCD66h0EO+gMf2XaV0INhtxjvdzQCodUpNRrretofpQniwpLEEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540946; c=relaxed/simple;
	bh=AiF3M2ZXGt2DD8dbuzeBj+thfVUxVizYfVV2gUrncrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1AsowHaX2h9XJR1wHmDMJR1yRsKXJx5fPPxBWkYa48kvIC62cPsZkjhAG/DP/DLCzoy5HyIjPR1ef/kJP2sd2fVKGtmaY6TQi3OnlKl1YNhQNCmscH7SHpbLwkJ3KpOcySzLgyy8t+kt/noK7zFx0jjbJ6PKxY+z5tYgsgzGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phDIoC/Y; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phDIoC/Y"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d208be133bso54898551fa.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 00:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709540943; x=1710145743; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wo0SJU7p2/dpepBvA/P9zsdXAkWlRWzHBTJpWaC47Q=;
        b=phDIoC/YF9j56UxFmM7poaxb/0cbk+SnS6P3ohrgtV0z2023EhEhBc9btQfl4eLkOa
         ZEMOQwEzy41EgMpa0U0xbczSWT4SOo/hY8BRr+bwMaR+ZK5FiaNZWpK8xNpCkC2GsMQC
         kScWLXkNAi8DaxZFCrm3+esTcvBSMJ6Y9iLo7p/d5MNx4UgKjBlFSCywZ5fDBZu6alLp
         FT/9IlS5x889RBQZRZYRtQkNn5fGX7X7yqP3j6yQ33FeMO/qyKhETVcKZKy9GZb0j/uZ
         GPEKdOrLxXEOCL3c0UmKcw5olnSRi4Ka7SzGHoX59IfJkVlGugByrzDN6kykxxHe4Zc7
         Nwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540943; x=1710145743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wo0SJU7p2/dpepBvA/P9zsdXAkWlRWzHBTJpWaC47Q=;
        b=lyl9JvQliDg92aYXlNTOyt01F1um5j/v7ClUDUZb6LvNnHu24WD+4qzO6Snql5lEeN
         O3LsXsf3PkAlQwXq8NQHis3vDPQGgHbNi79YE6414L5xBKq4rj1H188LdSp4Mdz8FlZW
         k2TvSowYNhQMShfo3/pf469uchwbXpnePPH5KYgmGOyLwRNsRX8rwg6BRnwflQdVtjDs
         LrprbNeEkFiRHBACSRuP87xJmRAzrYx55ZgF9QLYSDfkNONmisKIxn/NZAHBsrgvD2NH
         HPPWv5x4KKSk0xScT1QiYMaag4cBfPRC9Z1MLZYfMY9dbMrQrjKzKmyIg7+l+3609hqX
         DOSw==
X-Forwarded-Encrypted: i=1; AJvYcCXMkSmelf1IVMTgXHVIg/Yv+aPioN5bkZIld9ChGCcj/Q8Hyu/QAtx7SCzmxvRzf/VhJEj5vDTlo4E1KJXlmZNtnz4hjdO5XlYDAiAZmA==
X-Gm-Message-State: AOJu0YyIlzEaMp9pi8/C8TR/PimjcmrwYRiys8/gCEKr8KNCcr+K1KIL
	zhMkM/9hETa3zWq5Cj0uchW3xZ3hMaM7+POl9WQz7mid0NsWULLDACsARFl756o4i6D18UjAapN
	U
X-Google-Smtp-Source: AGHT+IHlP9u2qsK3YEBWaFlAHughEjQFuWV6BdioiPXHNX5f7Nu3vQLHQ3crSeYL2fYj6PpyWk+Z4Q==
X-Received: by 2002:a2e:90ce:0:b0:2d2:2ddb:28c7 with SMTP id o14-20020a2e90ce000000b002d22ddb28c7mr6033182ljg.26.1709540943507;
        Mon, 04 Mar 2024 00:29:03 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jg6-20020a05600ca00600b00412ddcd38efsm4226264wmb.21.2024.03.04.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:29:03 -0800 (PST)
Date: Mon, 4 Mar 2024 11:28:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aman Sharma <210100011@iitb.ac.in>
Cc: Gregkh <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Staging: pi433: Updated bitrate range from datasheet
Message-ID: <7ae15d44-d7b8-4008-97e9-f8c26b9323c9@moroto.mountain>
References: <0eaf24f26b1f7e89350b54a65c7f47a6@iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eaf24f26b1f7e89350b54a65c7f47a6@iitb.ac.in>

On Mon, Mar 04, 2024 at 01:19:36PM +0530, Aman Sharma wrote:
> Updated bitrate range for FSK and OOK modulation from the RFM69 Datasheet.
> The values are mentioned in Section 2.3.2 of the datasheet.
> 
> Signed-off-by: Aman Sharma<amansharma6122002@gmail.com>
                            ^
Space character still missing.  Btw, I tested and checkpatch.pl will
find this issue.  Please, run checkpatch on your patches.

regards,
dan carpenter

