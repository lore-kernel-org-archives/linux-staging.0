Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AE15DBBA
	for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316716; cv=none; b=oqZJufeXBz6cIOMSl6IOWvaPSfEFJG/XZL7f6Rlvmt4ztLtmWcQTvG4oh4i8H0XxtCP+8Q1Mr2p7LaI5U/+NTvyfB9DTXvxVo4iD12slyL8nWp2H7E0+a932NCselv29w+YSB55QVOIEX362nVXYTtzU0xYABPy9l/wMIErRk08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316716; c=relaxed/simple;
	bh=Tu87kNvAvBhncgUgSOfQbsabqiO5OQaqqDg932fYl9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLnT5vt7J3vwWsov7vjx3Fp/mvOnQ2Obbi+KprbFVO26k3eHdvHAwwNwnbjeIaZ551gJop38RXY3h+SvbuGxA71uNiVXqh84ZtUZLmo2naFhAIXvjOprVEAt2vC7gOcqBj4g+YjHNAf6eagUMeNnWfeKm7FX/no2GxOvZ6XrLlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BD5SNgJm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BD5SNgJm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so5618444a12.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 01:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731316712; x=1731921512; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu87kNvAvBhncgUgSOfQbsabqiO5OQaqqDg932fYl9o=;
        b=BD5SNgJmgbRIMVNv6tPvcM9y/AoZV5cbiu5DEmqqVkNaW+YjtHiAuCEJtttaLevqWD
         lRDq/oFyNRWhh1UZhLvMpkYiGXTfO8xlCxtg0lBo00xn9gm2lTe5FGSAnqWUhx8o7eLE
         NUYE3smsfYMhbv3ZbghClzplMaMvy74kqJWHfDnvOfAo3duZ7Ihjkh2+bXfNqUCNlT88
         12BxDkBpIhbIMNBOU6hgN7nYSACt0bFRKVfnYC2PEa6IIouhkGWzYLBKDSQOdoFupbVX
         yJIVEMcvhQzMXaPnX2+PlfXSXeFpJ/qrjJbAOxTLRS0rarz2Q0fZ+1v5u/HlLZCF4v5J
         tVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316712; x=1731921512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu87kNvAvBhncgUgSOfQbsabqiO5OQaqqDg932fYl9o=;
        b=dXeNzILsuIVAq1mqaQq4JWYOg6khj+cxy1qrIWTuSFZVJHbXu+vvcIukCKPiHtuSQG
         wOscD0N4B1WfxHHaLpWKDpt71AaffuZ4nCApaq/Dt2iMrRH4EGdgmkNoi5nMDVoidTOF
         jjYphRf1TXI36CVl88rc0swgchmhOHlXKWlWSsQZd45TWcdmplhpUWuemJ4iPDlbbqt9
         ttA2VcOLWmHpbi7+XDIWO+vHvTqZi0enmDiHlAenV5Ql8IOVrObUY+uA3jTR3AtrN2yS
         KLBHRoqQJWdkrLqKMeOOommtXFJg+3ijrX8eH4yjg7lizMs1AktwZe4yUwFXDXlHaDHj
         nZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYAfbHgX7z/tliDWt+LU2xlaHoOvAPA9gyI6hJrNBlLna4b23E178+Al0p0cHbRJP5/QDtAg2WoS3vRUMV@lists.linux.dev
X-Gm-Message-State: AOJu0YzSWPT+jOEiW5Mn9+QtO+hW+3ev+SmquDgOnrdTFYOHP4tsOy4o
	zBkzvekRS4eMrafbg0tZA8fvDFSGhSrHrg78AJjgdvTmBXfR4BDb6yHdZKls1CQ=
X-Google-Smtp-Source: AGHT+IG+xD3+4ORvqKbrrrbRirOgg5kTjxXGDgrBaLKaxvXuLm2vzeV+m9yfvKzCFTcnCurByccg5g==
X-Received: by 2002:a17:907:3e1d:b0:a9a:bbcc:508c with SMTP id a640c23a62f3a-a9eefebc52cmr1213666366b.2.1731316710816;
        Mon, 11 Nov 2024 01:18:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4a4f6sm566759866b.57.2024.11.11.01.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:18:30 -0800 (PST)
Date: Mon, 11 Nov 2024 12:18:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zhangheng <zhangheng@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: octeon: Use DEV_STAT_INC()
Message-ID: <b53b825f-ab1b-4d1f-8547-00d8fa461ffe@stanley.mountain>
References: <20241109091909.4038571-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109091909.4038571-1-zhangheng@kylinos.cn>

On Sat, Nov 09, 2024 at 05:19:09PM +0800, zhangheng wrote:
> syzbot/KCSAN reported that races happen when multiple CPUs updating
> dev->stats.tx_error concurrently. Adopt SMP safe DEV_STATS_INC() to
> update the dev->stats fields.
> ---

We need a Reported-by and a link to the bug report.

And also a Signed-off-by.

regards,
dan carpenter


