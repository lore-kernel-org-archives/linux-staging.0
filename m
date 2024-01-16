Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1C11183
	for <linux-staging@lists.linux.dev>; Tue, 16 Jan 2024 07:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsN+wjNs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e69b31366so32673705e9.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 23:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705388717; x=1705993517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2jxb9t5+74wJMLQv/R5pO4JWZ+rscYkotDZb6PZkFM=;
        b=TsN+wjNsMAlsi7/dFcR6jdR7iAQi0dNnAFj5rhcU75/h7Rxw0tn7RHDPCK2u9hwSAC
         ObzwCP99syKRrSsYmq/ePVSiJTUCasJdR7ftJ4bk5e08ntQI6L1mdMfLWhEuGyRPNl99
         wdid89HYSycT2zC5GvQER1CFpLOzJ0QNeFbJwZOBy9NW8DiXElTEntcsGOoXjrGKR079
         V1ARWIhp4jph4LffSPdC9sck2MM6F55h72SI/+qpYWCROXSDDZFDHhj13D23fFQ6k3wg
         k0QYmhRkWzBMBfo6MbIUMrBzKCoomlAqbSBLi9J42TLzlfNT2cN+/1qlNfSf/rtnyv2B
         0kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705388717; x=1705993517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2jxb9t5+74wJMLQv/R5pO4JWZ+rscYkotDZb6PZkFM=;
        b=Wcoe5HqdGzUhdr9eS0CIidjdLj+Skg4jLd/TvY/HHto+jxVQi88H30E3q9t0xSOs9i
         eQoJ9uQQWxq7TKD+gWITt6lG4jyqqXJDJIkYF/XV9+50EuecILK77JBcDJZQilBWuPCc
         PuFJ0YnPITrDcoWWdf32h/S+yuZ9SAPm9r7/CFFz9ugVUCjMC/k5z54EMP5tr6bqwfmG
         yDYX58VvuFrvMmRS3MreSdOA3iaxhnNoLPKt/7SJyTkd5q3vQZU+nGYK0bftU/YFS59z
         rkMYQcSrA0sE/29IvGaGmoBHx6opHyBX3tJArX5Q57Ef/hNa342o00eruVNoxyRe+YaJ
         V1Vw==
X-Gm-Message-State: AOJu0YzH7xp3oPQPPsn92WUzoWr3ORq6v5mDteX5hrLtmA0xA0ENM4kv
	m5F8GGxAOoVndig7yRgZl8Fwz9aq4uwE9Q==
X-Google-Smtp-Source: AGHT+IFpXWnp+b535XHg6Oxle7L28cfH3VJbMQAnTFqlqFbQZCPb8FYOz0E4Aqz4mEK9gTDBfdsNYg==
X-Received: by 2002:a7b:cd06:0:b0:40e:5a14:2ff7 with SMTP id f6-20020a7bcd06000000b0040e5a142ff7mr3586972wmj.124.1705388717391;
        Mon, 15 Jan 2024 23:05:17 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b0040e56830a35sm18147792wmo.18.2024.01.15.23.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 23:05:17 -0800 (PST)
Date: Tue, 16 Jan 2024 10:05:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: meir elisha <meir6264@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re:
Message-ID: <fcab42aa-bba7-4aeb-9860-6fa78b046bf1@moroto.mountain>
References: <CAHdEp88HTXMawhNNyoPerPFp7kYQduYMJCNL0KR87_5ry4si3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHdEp88HTXMawhNNyoPerPFp7kYQduYMJCNL0KR87_5ry4si3g@mail.gmail.com>

You have to send an email to linux-staging+subscribe@lists.linux.dev

regards,
dan carpenter

