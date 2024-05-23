Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1630502BB
	for <linux-staging@lists.linux.dev>; Thu, 23 May 2024 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716494848; cv=none; b=NnInKyWByqNV24x3IzbLVL4QooavUHHsoyO0FD7tivaTaUTmghqCtKCVt1AFtALsRyWMzbS34HiSRV+BEQpRxNlUa1u1Nnm2q/4ySUQZ1DrQvoHNY8lO0I0398idZ5+741rMD8GCBjnOIrzAKoFRdY1ZNFP6tb9r2huMnspj4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716494848; c=relaxed/simple;
	bh=2d1CJhorrDMIVYkpTcXwLIMkbxnSfCS2p0mDoQiNPwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiKWuccDlSt0zqnoF5CFPwL1cWIv35lxsJKF313uJIAy7VDcAyIffbe/tld8Hg2e1d7ArO24Z1nZAJ6O5G4vYA/RbLlgkOFfeRVJLgUO+qpRjxWAjqF+mM3799pzYMZqK8WmaOGS9JizW5Q1Z44pitqRddPGhEWXFIDoYepvKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b199HmwV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b199HmwV"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52397dd31a0so175691e87.0
        for <linux-staging@lists.linux.dev>; Thu, 23 May 2024 13:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716494845; x=1717099645; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZaW0YeWd9W9RWy2XGhmCKnTq6HAsW7a5Iz8eTGNYJ14=;
        b=b199HmwVzJDl6yGGNJYTeWDdlXaShdUoEXV45HmGBkcB8+i/yRnZcOqAqXEIqTwXcR
         xQnzG/dTvJc4u+GJHxTMCTqNBBVnBIq9+5OqZE8IiH0PVT/bA7ByMd7l6wITLwbbgzsz
         fUT8WJK3qO0S8M9kuwcyk9MB09mJus5ZyMRwqRW/D9T/6z8klUaO6mMu00vIz0WC7O3v
         VqmMowtlQVqaWMLlxkQV3LAy96UwNNy73wYfej1tlknC1F/fQiZ/guZjmYzzZhHXT1lC
         edE+j86RFT38H8vv47WIpkE+WFR7KShcEIwz3ydqKmxccmWY7pRKfEFHBT0C60nd8H4y
         Tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716494845; x=1717099645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaW0YeWd9W9RWy2XGhmCKnTq6HAsW7a5Iz8eTGNYJ14=;
        b=fnGBl0V7WC1+jDuDcyC6IMfRfKybLVljgqcsaJZkCN4BwVtfves3bgG5N+slADG2Ox
         plMnGuK5VpQFL6wZz4EWcjocZcU0WubiXA3L0eGXCHtAY7t67i230VavZZl+tpBPswVH
         w+cvCmUCoPzT/dC3Ynk1Y/YyHg5o3wTzxX/mWGewy6g+/Y+WUIpzPhOCN2HNiaYgBkds
         WV/i85hRtSRs7zz0Q7Qi1+y8dVnQVLP4BIkeMrowRzwwbJa4fU938dbgXSYL4ldK0e+f
         CfiH8MSkEXOTDZpsgd81BaIqjPOOCQjl1SWpq5B4fy46uJtCh0V/wA+QFG+T0oo6t1qF
         zhsA==
X-Gm-Message-State: AOJu0Yy8rEstRIi5pLKtF4Fmt+MZRQYCBzZEzXpgV9wgto6yWfwIDDk6
	7lUPnadL1vzMDZq3MENE3dnp1IhE2lO4ZKOyuojUF7LbxbCxRi7V
X-Google-Smtp-Source: AGHT+IECPlwCDpDrzkV9K4kzMzuvIu2MUp1Nz/mNd/l/h0qCNqTxfv04Qrg3eQ9DyAzjPy9VotCIxg==
X-Received: by 2002:a05:6512:68f:b0:51f:6b63:75a6 with SMTP id 2adb3069b0e04-529619867acmr109619e87.0.1716494844854;
        Thu, 23 May 2024 13:07:24 -0700 (PDT)
Received: from [192.168.0.102] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817088sm4265866b.24.2024.05.23.13.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 13:07:24 -0700 (PDT)
Message-ID: <ab941550-b78a-4b30-a3eb-68c8967f6cb0@gmail.com>
Date: Thu, 23 May 2024 22:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Fix spelling mistakes in
 rtllib_softmac.c
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org,
 tdavies@darkphysics.net, garyrookard@fastmail.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240523035952.59724-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240523035952.59724-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/24 05:59, Roshan Khatri wrote:
> codespell reported misspellings of temporarily, possibly, notify and
> param on rtllib_softmac.c. This patch fixes the misspellings to increase
> code readability and searching.
> 

Hi Roshan,

please do not describe what you do in the description. What you do can 
be seen in the patch. It is not important which tool found the isssue. 
Keep the why.

Thanks.

Bye Philipp



