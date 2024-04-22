Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA4154BEE
	for <linux-staging@lists.linux.dev>; Mon, 22 Apr 2024 17:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713808552; cv=none; b=fZIY+EiImn4spzlVYVKMlJx3VcRt1LIo9jdy0HJ9vO17wiSXkINj8T6iqmZgLe+gkJePro1TQdln9N9mQPLGwKySFT1AzOULqpaQkSfTBic8vSTdrKDmaIVyPSB0Qnq8x1pWKoDG9i4DVn6nxA6kAPI5AWGwRz0SKUGVICrPPk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713808552; c=relaxed/simple;
	bh=JSZu+JHGcp6O5rFJwB0+7gm/1fUE5JP/jTsLbXnt33Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=I7SvFRLBZLfuTf+Kab4j08NIkN7rlh19pUu3CapmdyygQ7hGR/Mo/AtR2NMMndWacCR9hrxHYHNJCRQkg0t2JOes7ga4RtmvdJY7F4QkgJk3/XIyvYdDQjlpRnRcRop3cxE7r5CrnbPQan1p67O3r+cGzPzqr0+LMwHPS/YObp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf+2c9AQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf+2c9AQ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d585c60bso549334e87.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Apr 2024 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713808549; x=1714413349; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq4UihHHPf8X9fkzW8/5yOFWNRtWLeXNtouM4+vRomo=;
        b=Gf+2c9AQ0cwTqpVM37Qxr4iV/iL1zp/t0R6wAZ4EykQFHA6ztmSUBJR1TcWELJsdlw
         q9mE0GJ/PVKSE75izxo/cm03+1Ln7WReUvdMlVt7TvyIa2XJvobeXG9Jwu5G3uDGNOSz
         lTFw7aHqabLhxXZB2km40laO02V7zDMjuPpZaTicg4kucQHBWIFG66geERZ0IOS+5cwy
         S0dRv8LbeJVa8I9jry7kthtjxoXspIhOAjyChwiWZhDj4q+G7f76MXLOjhHHHKk09A5I
         Ha4sl74ACTqPMPUrQ6n3YO8v8TPOa5ZPnB+TX3IPclP0YYSKdjh7/X+IBB7mMfDPBQBL
         Y9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713808549; x=1714413349;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yq4UihHHPf8X9fkzW8/5yOFWNRtWLeXNtouM4+vRomo=;
        b=I0xWjAxZT6vAJVTJx99zENN2JGEwAzB4M4TG050faOMIPzqgDtFa14gV/RqOIyTGMK
         yYlUv1Rz1LUVMN/A6OdDde8eJdqrtoDUOCU5Zm+Stq+jBby1mFaZe6+7OaAbg6svmbiT
         AojLQbbapKX5layNL4IeunSTxYXtw6nWNcFjbuay0SpGejqU+5IShzWYrVvTU3q3i4P8
         P8YgNChyR6Gn5DYerPbb6DRvymAG4ge2XLKDDy2SKz5sv9avWxvsGcg2wHdjRp4tE7Fe
         ud2kv0wPze3xd65c2uhkvYrWU4Ce5cZyDUKHJxWC7XfeuV2ciFW4w/AMO8DLqE21SvUn
         jChA==
X-Forwarded-Encrypted: i=1; AJvYcCU0MRnGn92nA/xHK16RlqgIHcYJFhBhpgCD3529/MzuUkeTAAaIxQfMMhZII+jLXfNuCoZZg9vfM3/k1Wf7f9ABoDVudmC+t/HXIs3gFQ==
X-Gm-Message-State: AOJu0Yw2sV5aEHpG7sXJiz8rE+k8rGhQNWIrUgb5JraVOz0d8lDfnPKB
	6GZ8N/rkBaYXp8K9P8wT6SDzx2bUD9Ay3chIgLjLzlKhm13tUBQs
X-Google-Smtp-Source: AGHT+IFwMaFrfp2gvzap1J8QnviEFzpNnf0imbW5AdxuOzeoKDb25tpi5xxF8SxqM7m1vtyY0hbthQ==
X-Received: by 2002:ac2:4db9:0:b0:513:ec32:aa89 with SMTP id h25-20020ac24db9000000b00513ec32aa89mr6629628lfe.2.1713808548539;
        Mon, 22 Apr 2024 10:55:48 -0700 (PDT)
Received: from [192.168.0.104] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id x20-20020a1709060a5400b00a524b2ffed6sm6012023ejf.56.2024.04.22.10.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 10:55:48 -0700 (PDT)
Message-ID: <f82fffbf-a983-4ab4-897b-b5a810426f04@gmail.com>
Date: Mon, 22 Apr 2024 19:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: info@sang-engineering.com, wsa+renesas@sang-engineering.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] staging: ks7010: How to proceed with Spectec SDW-823 microSD
 driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wolfram,

you contributed a driver ks7010 to the staging subsystem in 2016.

In the first commit description you stated that you have not been able 
to connect to a WPA-protected network. Did you manage to connect to a 
WPA-protected network at a later time? Have you done any tests with this 
hardware in the years up to today?

I am asking because I tried to find a test device to test it. That is 
difficult in 2024.

Do you think the driver can be removed or should it stay in the mainline 
kernel?

Thanks for your response.

Bye Philipp
