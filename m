Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C94A21
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048173; cv=none; b=VnhU5lwK66vysR13PDevannCN2RCTHgB0T6grqrAjm22KSDjST4KS5L+rx3p7gD57IPUL7F5zinJb7OUTvkmhuKomHKNVob2PPwI+EDoyZHOcQPnI9s6oY3OdgybE2mkrKwGwxagUVBxCB0Gzd6/DU/YUa9oq3cVgWhj6tyv6SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048173; c=relaxed/simple;
	bh=VZowV171Nm0XistGOKs74QOrZOr6h4Rge3MCAkEFp+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWCpOBb9IYXI594cNBSgpM0mraOPBGzh4lCGtydQCctttThoAhK7xVcFOySEeiHGBv1Qm83zW8Fa5EPzrK0iMASMANwocih5WdNkRG1dEcuGw+fDr71i+2Ipo5SeZ9R02F4JRG4yPyWM0maXX6AVjjQ5InNmMVzCUDWcFjAzNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEfVd+E5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEfVd+E5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fc7506d4so224471b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 11:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751048172; x=1751652972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kntk2ixuTAPii9dFKPtCKI0goZYsmp2oBVmbclFPZEg=;
        b=lEfVd+E5E59C2PoliMqaoCj5ngDs9EQSzzBhzKpryom/I7q+0/0ClaaKsbNqkyWLH9
         50+xiql2XuGofqekQHiord6spWU467G2MDAixRBHOhXN8+3EYLgL72D/fqmBjyYTJ+4D
         C49j+NBl+akjBFKdv7SNosxFirdTpSRTAj1C/0J0PD+jl3zIDTV2oAgGQFoAdZRR+X23
         xzP/skP6L2mISeLI6u8m/n2CViB+y1ecc4uJD2kKzcgVNE4/kTJdbtUruCeeA9XLhttA
         z4MAwc27/d5ZzPjj7Ex5OvAos4J32GE63Vc8H3D7ay7zv56rAe3mBUpI59rCV68riDo1
         dsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751048172; x=1751652972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kntk2ixuTAPii9dFKPtCKI0goZYsmp2oBVmbclFPZEg=;
        b=Y0IuOtatz+tV7WGzAgxqsFC45NAqKtUh08dBqwP9LwKJzEn++JTv4YZs4+dgkc7DWx
         PqYK3hBCWfaP3Z632zhdF3ZBi16sAqY8gfS7gdhK9gADvqcjvpFh4m19tO7VsF3te5tY
         dCgxxXxtPJnY0D1YpgUNej3VxQDEWc8cFC2z7lhGfdWQBptAuhH/V7Dui4tZjKg2YUog
         En7brgYBSxa5VjWh1R4OncVpW2/Dlf9t7Ggk0tA1JdJWd1hvxSRsXP1HOyK5JCfDF8JK
         hS7CXSvobJjon2Hv5DZw1D5YNLAnyDH9Qe/OxzHfZohnzxS0zLOxlwldgpeLftN9wZoa
         0KCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmUeY/KRWkdt1P1SxmwlR6r2Yua7v9jnsxeXUpp+6cNZdBmUIR9vMzWVBn8gHPfAW+qwqIXSf5D9rn/J9J@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0MaYonsDsJ9Bd7ob7f10T3Sgb9I+u3lulhrtVlCzALxjGYKXS
	eoOy69/c6ot/Urt0gJu4CSG6H6r2Q4zGnOGYJnpoAwmkipy2BmVIppJz
X-Gm-Gg: ASbGncvVqLBQ0BEo6e5GpcLl76vFFy3a0Sg4mc/v8LGrHf0NALPAJwDBwSDlDVS/kwW
	r9Y3kHv5p60vqfxJETF3zmmUz36mr4H4Idp+YN7z7AJEcG8e+Te/sIiCVKd7sIz6kPw88XEQZ70
	D2U9sZeRiwsjNMFUd2KBvgJqMhDcA+LG9kOnzmLhkPCnptepOtr9MLkMIfG5xW9uPhdW3w3jcgy
	2hz0TevaclWAQ42sLVKzJMrHdVqpiCUXZAbGNrmzBkxzIEOT1g3fj+6BT52AY9xT+6iaR0TGUvT
	3GXOqALxZXMTiRgqRvxjhUEAYS14pcGZZ6OKXe4KJ7YeXQUTUEkvNMLSarfmH4k=
X-Google-Smtp-Source: AGHT+IGsfDuPOYSFYou4KXdl9S3Jhy/VdZYaWCldI0+7hD4gfeDCNDh3T2UzCz5JIyRObCJH/6ANUA==
X-Received: by 2002:a05:6a00:3d0a:b0:748:e8c7:5a38 with SMTP id d2e1a72fcca58-74af70469b2mr6613546b3a.23.1751048171643;
        Fri, 27 Jun 2025 11:16:11 -0700 (PDT)
Received: from muxbit.. ([2401:4900:1cb8:b350:f061:66f3:baf1:5b2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af520db66sm2648601b3a.0.2025.06.27.11.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 11:16:11 -0700 (PDT)
From: Manish Kumar <manish1588@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	manish1588@gmail.com,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode[] a read-only pointer array
Date: Fri, 27 Jun 2025 23:45:58 +0530
Message-ID: <20250627181600.9814-1-manish1588@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c8f5f917-8412-408d-9dd9-6635af8825a7@suswa.mountain>
References: <c8f5f917-8412-408d-9dd9-6635af8825a7@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dan,

Thank you for the review. You're absolutely right — changing the array to `const` breaks the assignments that follow.

I've reverted this and will send a new cleanup patch later.

Regards,  
Manish

