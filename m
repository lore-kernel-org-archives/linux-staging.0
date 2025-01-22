Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA61DFFD
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 07:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737531461; cv=none; b=TPu21iVm6eOO805Kd1vYciEaQgccfBEQSLMLGMXXBQrHhXUMBMA+46jZsWSFg5MRWgvXOePc9TvmskzG/EPT6JvHvFrLPJBY9dZZxReamPU73Ne+wI/mkpp/fUR4Q4GvW0QiTlsUhL20Jo2R6jBtQgpN9TeWQ51w0LxpUjCRmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737531461; c=relaxed/simple;
	bh=VWwydFgNvCWiELV0oJ4KItE6mZdWyU3N0xVYBWx7mo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwhcLO4Rk2hvmdEwZd3GcN5dJAk/mQ1SoxJSJUmy/npDTGwhF+5A2D5nCK2iBIQLC2D/HXQ7DrCQtq+TaVIqvp/9TzpCbM9loD+4ZtjeSegBag2t4jPQLXO+jfx15opXXaVtgQfRlFfFKhgUtlnMJwdwh0DeE85Z6VmrooIDtL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKO7Bsp2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKO7Bsp2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso3446500f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jan 2025 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737531457; x=1738136257; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNXAv1sOgHnAoK/xiQRFluG+pZsyfhRNgiqEuvcBE48=;
        b=vKO7Bsp2/NBikCZb3UlzXZ3TIakmGBk6ocP0nw2ysy0MDMZbd2bKANx4GySz1sVlmR
         SIBn99YumpFTPvWjx6ETQvFVvm2HuKMT8WnTEd+nQT/U6RF3ZWQhC6dB+0pQ0GZHReJe
         9DSW5HZQx4rB5bXj4QIgaqXLV3MFMOpt0uF1DjpMIduJSaMI1HcPmLwdm3du8i2JsPXd
         BfHHhR2+aCBsSczC3I1LG6p6TSXK0rTkWiHh8DdYeDKIK7+e9noCz7oQLu2aIzPu+P1i
         3fy3PpwKkbPR9yW6Eb/EMM9eXtU6CAB+hwTY1W4kZXwvoVUHHQj1+XcA4AXpIlQQPyZ4
         0lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737531457; x=1738136257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNXAv1sOgHnAoK/xiQRFluG+pZsyfhRNgiqEuvcBE48=;
        b=QS7CA8YDlwNIGd6WozIN4hfYw4+u3n5TMPs+y4gyW7OQ3sUy+kkUALfMxaLxbm1VKe
         /S+juaSOU9W7WXa0MPYK9KuiatWh3Uj8xgeuEPomLR0b6yZE/U/C1i9rO3S8fdEJDMFs
         5I1vREyOstFy2GDAvD7+7QuSPVwbAx2oyfcFrcr/gLLmubdeNu3ZU4W6qbMqFGiJ8W5f
         PTU2rrF496M5xl1qYiPBktMEFlaYemBTWKYKrkv0zCzpkkBQ191+YU8CfM/1knvgITd/
         3eiofWMKUGQdLWSpgsGGa2eWiVDGBAfY17LtzuhpxqDB6onfW5bsSl3140bIBgcbwfDe
         QQNg==
X-Forwarded-Encrypted: i=1; AJvYcCVYCKg8+VFvLnLMWHWdY7sEdOC/0hml81HNKJbQyHpgRWUGVnoSQfltiVjfvIbelv82KvdECOnmEFRfsfqr@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc94WeAc7q8PATTZPzQv4tMfCFpQnp46hNu0qSx+Cvg1wmJ3+4
	iXu35+rxu0ZgvblbBdrQsXdny/E/Z8CZOfV07ovxi2qx99uXckPJDya+yCZLVuQ=
X-Gm-Gg: ASbGnctBSw9Gy73t0rxFTU/Tt4Kv8hHEUtYW/1PRb1WEZtZxJKNPMxiGZcnEOIMfLxp
	MeljnRcGhiXONoL7AsB8EFdZGDfLWzSDFS25Qj/IZnumGrIHbmNn7/8Zsnz5ToFyZQIHaI/y6lJ
	r9i9Q39PIg39Rz5tSUNNB9JDISOH1xNLNHbxUrx/tiFGRLbJdkepSm01KE4//ddjWCxvqePD93j
	oQuO75EfJKhrTZAYBCjW49eiK3ws9JWUDcuh2jlGt1QF2laThCmadbixt/U75fHkBs5jDux3Lo=
X-Google-Smtp-Source: AGHT+IGTbLbW27zAi4Tv8DUMU6utxaKB8tEU7e1Ul0eZCzKJckoztM2eXFLMWROGgI4cBrdHOxHiug==
X-Received: by 2002:a5d:64c2:0:b0:38b:da6a:8a02 with SMTP id ffacd0b85a97d-38bf59effcdmr17934215f8f.47.1737531457257;
        Tue, 21 Jan 2025 23:37:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b65sm15800453f8f.33.2025.01.21.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:37:36 -0800 (PST)
Date: Wed, 22 Jan 2025 10:37:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Make static and reduce forward
 declarations
Message-ID: <6889992d-043d-4af8-869a-84eea9609148@stanley.mountain>
References: <20250121203342.20410-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121203342.20410-1-dpenkler@gmail.com>

On Tue, Jan 21, 2025 at 09:33:42PM +0100, Dave Penkler wrote:
> Declaring the entry points as static caused a warning that the
> serial_poll_status function of the agilent_82350b driver was
> unused.
> 
> Add the entry point to the corresponding interface structure
> initializations where it was missing.

...

> @@ -842,6 +824,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
>  	.primary_address = agilent_82350b_primary_address,
>  	.secondary_address = agilent_82350b_secondary_address,
>  	.serial_poll_response = agilent_82350b_serial_poll_response,
> +	.serial_poll_status = agilent_82350b_serial_poll_status,
>  	.t1_delay = agilent_82350b_t1_delay,
>  	.return_to_local = agilent_82350b_return_to_local,
>  };
> @@ -869,12 +852,12 @@ static gpib_interface_t agilent_82350b_interface = {
>  	.primary_address = agilent_82350b_primary_address,
>  	.secondary_address = agilent_82350b_secondary_address,
>  	.serial_poll_response = agilent_82350b_serial_poll_response,
> +	.serial_poll_status = agilent_82350b_serial_poll_status,
>  	.t1_delay = agilent_82350b_t1_delay,
>  	.return_to_local = agilent_82350b_return_to_local,
>  };

So what happened is that Sparse was complaining and you were cleaning
up the code and you discovered this bug.  Fine.  But bug fixes need to
be in their own commit, not hidden inside a giant cleanup patch.  They
need to have a commit message.

Quite often it sucks to discover a bug like this because the bugs have
to be fixed first before the cleanup.  We're a bit less strict on this
in staging because realistically there are lots of bugs and lots of
cleanups and they're going to get mixed together.  But other subsystems
maintain a fixes branch and a new development branch and so bug fixes
have to apply cleanly to the fixes branch.

So in that case you would need to save the diff of the cleanup.  Go back
to the start.  Write the fix.  Apply the cleanup diff on the top.  Deal
with any failed chunks.  What a headache!  I get that.  And you're from
a gmail.com address so I don't even know if you're getting paid to deal
with this crap...

Quite often it sucks but in this case, it's really easy.  Use
`git citool`, highlight the bugfix lines, right click, add to commit
write a commit message and done.  Make sure it still builds as a stand
alone patch, though.  Quite often when I try to highlight and click on
all the lines in a bugfix, I accidentally leave out essential pieces.

regards,
dan carpenter

