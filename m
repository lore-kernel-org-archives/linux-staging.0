Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36409443A88
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926793; cv=none; b=n33BXYt9ALVrT+KWOPZZMd4o2/rzIPVheHwEK98j/G0cHcBcqwHx1q7+Qy3c7n4PqXat3gzJJG7pHzfNkyvgdd/gyVSJmVe1lQ9aDspIwNYUuMNZVd9OCJ3Z/1JtKzXfcvWN3HrLafuxbeKcolbFKIrQMlxDilwX5+ArvnSJ1E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926793; c=relaxed/simple;
	bh=mTF/wwTe7raAFFshxqGZxYfSxrkUHIRFyehiPesUjNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6ERaCiY296U43madXvUCLFz6LL7LDebF621zf+jza7FuF/Yu1ka4Alx1PbJt4VtZDNuayLAKQQw+2GtElyBbsHXfnhnwFudz6tNV/fvAyztBh31wx3CioCPUHgXTauF713/yRXawC8dbnr48otPubeMTz7dc/8Ih117h2Y1YO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRFT3U8n; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRFT3U8n"
Received: by mail-vs2-f36.google.com with SMTP id 71dfb90a1353d-5d4ea61c057so2482129e0c.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790926791; x=1791531591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTF/wwTe7raAFFshxqGZxYfSxrkUHIRFyehiPesUjNs=;
        b=HRFT3U8n1NK45KGhR222bZA085/TJGF/PcO3Qq2o5Eakqnk0rekwsY5sAh3xn5jJkd
         F64gx7P9a8uOHXuaQnodvYn57ImPdEHtsEjYvDOPzUPeCowy5HTqR5HcyDTgI6kGbssR
         f9EaXEsDtyaU8DY9vrYLLIKW6lbAc+usSjMlCurIBJtzktpgsjmM6na7qX2P5XKGh2CU
         UqHr+xuBj6Kt2rTLTVNlVMHVKcWcG2OwR0PrNRUnqblphdYhJfgrO7kIahl5BhN4KDyi
         HMmeOJkU7Txi7VXIrNMtGE49p4GdrcHTGJpixNLJMNQ8SAfojk+bV9k3pgyT8GnxG6ir
         BM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926791; x=1791531591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTF/wwTe7raAFFshxqGZxYfSxrkUHIRFyehiPesUjNs=;
        b=mudIomI5Bq0/S31LUhgdzSTFQ+sL9wi/M2xqxJ4+0xP3t2aA/e58YkyWof3qvL+kyb
         N4rMPHMEVwoxNRlnLYMz9rMNOAdYwsgyOuTvbanQ4gZtspi8OubVSzuxtz9tcZ7HKZLx
         U7QjzJgVws9hKZKin5nzGZIsNN9wLTiF8M3Y2+BMqbwCjarOpdT7KzRbkoSXCXNDWRG0
         qSfazII0zHYpaJtepilcbNbZs0AUyxHMTU2W7rH5ZdeFst9i6oOMgDLpA4f2k5w5D3b2
         r9jVqz4V6up+CfWJf656T75twcbRkIpXHUyitBwQOZlihX+VBU3wb6dr/DxvCfVr9nUZ
         mLdA==
X-Gm-Message-State: AFq9FYJAWWd4KT6PyOF01EmTJOHKLXKYs9M8KF2cx9C98DoX/29HwyEg
	DCYe1HcLjdyeCp39W/cgbVsFScg/NvZRz3xd171Ieo2mpQfS/hJHcYeSExAHew==
X-Gm-Gg: AYBFou2DoHsDlOFbUcsFvonvJcdG4rAntieh4/wjsP6TxT8L+IK0Ck5QGNns4MzPD8Y
	2jkxXTXS6f+nPc4rr2o55H6YdcYocAXnq0dj9WPXVrmjLNjqHVzspoRUKzPOlfavhUIclLHfK2L
	JN1McJSeJd2pipg+pTllzrdvl1g0YzWl9NRnvpCCuAtl385725p6XxqIPhINV3q73Ptx2oIUt82
	+4OxemZFhOrNTasxMd3+tnbzDmKeec4W1lp515P3v0K+OJBEnHIg86vpGaiWlJ2zw3LmZuN5uZi
	Kkh/XeyREqMQoANOOu2O8sf0gEPVtAb3iVpqdcymhC1iYb3iOHjDq2bk/U7aMLjvUBnFiOdmEOb
	RGWCkL2co8vz7Xywc4dE0NVkqhKi4D1lPhkcFo1XsPznoYJAikWpBLA3JGFXN5NC16Kfm+v9P7/
	atRp+NbTpclj+/KklxNDkUhJdS2e6N+gTHajOeh2U+EufSLgXSkNzH6WYfjXEGccw=
X-Received: by 2002:a05:6122:f84:b0:5c9:82a1:a6a3 with SMTP id 71dfb90a1353d-5daaf77f0c9mr645246e0c.6.1790926791020;
        Fri, 02 Oct 2026 00:39:51 -0700 (PDT)
Received: from debian ([2804:14d:9ea1:8718:c77c:8:a40d:84f2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da568a76f6sm2631074e0c.0.2026.10.02.00.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:39:50 -0700 (PDT)
Date: Fri, 2 Oct 2026 04:39:46 -0300
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Message-ID: <ar9fwqJ04CzzSy4L@debian>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
 <2026100211-scenic-eligibly-58f5@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100211-scenic-eligibly-58f5@gregkh>

> When doing logic refactoring, testing on the real hardware is best.

Makes sense, so should I be dropping patch 2 where the logic is
refactored, but still do patch 3 where the inner loop is extracted into
__phy_tx_power_limit_to_index() to reduce all the indentations?

Best Regards,
Leonardo Martins
