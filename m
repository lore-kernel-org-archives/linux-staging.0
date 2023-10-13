Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D193914281
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SEshn9KE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3215f19a13aso1900292f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 05:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697199164; x=1697803964; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8LGZJR/y71MrZNroBvIwe7TGxhLAIZsz9Mp4xjRfDNo=;
        b=SEshn9KEkItm3WDfTn+JA4dfNcJ+yJCDrZqD9NQnBl0RhS381deqpn7bV0DKiyA4/r
         70bOmZXsImh3xO8ZcbfeUTFXr8uyR0qucbii7QBnpBYXBbMyZfXI2qk/EAR7b0dzqN7a
         vN+84oCa8kb0L6w1lOWXxuuDuw+//VY4HlJXrbbmDNg236Zq70ysy2Wm/A5Z3PcqY6ME
         USgWFihpNNZhTLq9om57wxx197Ab7bSXwlpiX3n+L/zp/yDklwmCws29u18Gt8jirB+a
         LQFROb1XBwb5FvPMzIgZ2SHwABsc300agk7CnexTKkoyJkbmXA4cjuIN9+u7S5VFdUsA
         A3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697199164; x=1697803964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LGZJR/y71MrZNroBvIwe7TGxhLAIZsz9Mp4xjRfDNo=;
        b=SSoWKZZl2x0L2cxqxNVlQIE44K958fLtACdHUucW7Em/yDLpg+acOq3nq2rsQBj6dI
         baj+Yk8G0WaM48md0RReGHE1KjcWOCT64zo1SfGLC5phRT7SHQephQw9WgsAklhw8Wam
         SlQUmDbZSRFhAkt8h8g6L/VhVSHcjJY9kbA+kb9UuSH5yLGDZnIndOqzXYycfhIgwGMJ
         H5tYNCdnrFI86qGr80orHfEDvfb4YgaDAgz18FZARS+UMN2xgH/9BYlHPGEoq5F5GJ0C
         fZFOoIA2eQD36Ow7pQzPcOSzX+GP5ag9Yx7ih8kbe3odRbsj56B8i/gbTgrPo09z0PAo
         ycWw==
X-Gm-Message-State: AOJu0Yy8TNpORE2ANp/wYz3RYus4Utjth8z7z7HjAoD6oYAFlr5raE7i
	L8+ecH0k3n7yfGDpgVf3lbGp9Q==
X-Google-Smtp-Source: AGHT+IFrQId3e2I2JlTBoULYCR/H7+bsaYxtMNZ1tZUYf/kvRK/eOFQV33wAqP1yoQmYpPOmpLznjA==
X-Received: by 2002:adf:e383:0:b0:320:1c4:e213 with SMTP id e3-20020adfe383000000b0032001c4e213mr23211870wrm.1.1697199164056;
        Fri, 13 Oct 2023 05:12:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i17-20020adffdd1000000b00326c952716esm20467669wrs.61.2023.10.13.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 05:12:43 -0700 (PDT)
Date: Fri, 13 Oct 2023 15:12:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: wlan-ng: remove helper function
 prism2sta_inf_handover()
Message-ID: <67d90726-15b9-4d64-87c6-bfbf662cbe81@kadam.mountain>
References: <ZSkg7y2Y2T3midXB@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSkg7y2Y2T3midXB@lab-ubuntu>

On Fri, Oct 13, 2023 at 01:50:23PM +0300, Calvince Otieno wrote:
> prism2sta_inf_handover() function basically calls pr_debug() to print
> a literal string. This can be done by the parent function directly.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
> Patch version v2:
> 	- Replace pr_debug() utility function with the module specific netdev_dbg()

This isn't a v2 patch, right?  This patch assumes that we applied the
v1 patch...

This patch is not white space damaged though so that's good.

regards,
dan carpenter


