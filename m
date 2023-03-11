Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D77B;
	Sat, 11 Mar 2023 12:39:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j2so7395384wrh.9;
        Sat, 11 Mar 2023 04:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678538373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5ymF9kHOMLefiz12Rv98z0NE1tYU6jJ7RUypvP5at8=;
        b=hzC9H8UxblqYsyDYYldUy71UHauWYeyuts9a8n4EThQhv5UC9NU8Qtz1oiLRy+sDRZ
         4g0KEk59TObxpk+ZRf1jhAzazA/X7abc6oRFbwdrzGOGqsBNpJdutw8wk1KWe0hSV8DT
         Em6unX0jZwpsjdmZ8dxCbxs6iP+jORwrXGGjD7UfJwO5mHcqYLTyda8Ti/lpntuXFKxj
         j4iUNJD5B8pcE6li8tnjuoHBJ5SFaF1UK7GTVhNQiVqczODwq/lYP+PbdTjRzLoi1Dpb
         W/4zNed8Z0io9MZXrtwgb3gk+3u3eGEw+Zgl43xamtofMx79BeqHxKQ2krIwalSLdrFN
         74dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678538373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5ymF9kHOMLefiz12Rv98z0NE1tYU6jJ7RUypvP5at8=;
        b=o/FQOkQfwxAPPgmLqC7E9xGy3+sVgdK+TTkUycFA06Ch3KW0d3CwLHzhOLgduCIZcV
         4lP4N/zGg9TbbfMiB/owtciIMd5tHoEg5tA9/MSeJIHHq3CowCJgZq4GcEeg0ZXmWu01
         fquT9/BeLKOkLlCgO4Yr4RLOTP/diFNVchEuqGH2ukZUvm+pEGlNz1LZyFlbOuhsVCHc
         RcX5CZcKcd7HDuSe13elml4np/CTa8kWvGm2JMxRtGhWHhMCxYxKeNKZVkLPKn7zFx8D
         BOY5t5HuRXVbsb8xWXYZcI7H2s4NtN2Ywy/I7NbJVKTnMsKJJ39E2Js8ON9TTJfhiEbO
         DErg==
X-Gm-Message-State: AO0yUKUu1NYY75e2USOn+zU5vlhpgeNYfqZiI2cyfymWvhWViw22xBLa
	l7xHDcueDAHQazOE06UvFPHg0xoQA85GGpsi
X-Google-Smtp-Source: AK7set95Bp+Ah6AoER0cNsasdr8Hl3ZBhIu0SL0nSrVtjCEuu7Dd8p4QxUaM3MdHn2HgezDdd9QawA==
X-Received: by 2002:a5d:4a51:0:b0:2c7:778:5da6 with SMTP id v17-20020a5d4a51000000b002c707785da6mr18782112wrs.42.1678538372768;
        Sat, 11 Mar 2023 04:39:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d6a86000000b002c3f03d8851sm2448270wru.16.2023.03.11.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 04:39:32 -0800 (PST)
Date: Sat, 11 Mar 2023 15:39:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: pi433: Change bit_rate type from u16 to u32
Message-ID: <b9d62635-b968-4dfd-aa10-e34e38a114a5@kili.mountain>
References: <20230311122346.GA21752@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311122346.GA21752@ubuntu>

On Sat, Mar 11, 2023 at 04:23:46AM -0800, Sumitra Sharma wrote:
> Change bit_rate type from u16 to u32 inside struct pi433_tx_cfg to
> support bit rates up to 300kbps as per the spec.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---

That's not right.  Read this for more information:

https://lore.kernel.org/all/?q=pi433_tx_cfg%20bit_rate

regards,
dan carpenter

