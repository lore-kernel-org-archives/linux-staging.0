Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B312F185F;
	Sun, 12 Mar 2023 07:17:04 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id ja10so156739plb.5;
        Sat, 11 Mar 2023 23:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678605424;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJAiYidXikRagrvs8QJrX3AufqF9vXtWgvBYHZzmNh8=;
        b=iXVjyBpy4RK3fjvyAbhHZrjwh2ex8mT6arPVKf1A6BCobz0X+Fd56fOCekj6EKp6Rn
         HmEHrrzDyOZ82VIgvleNWWLgCi6+aCWs2p43gie8snExM+MA/SlC5f8cgIQTQRTaTRL0
         FJDMZFKc2xHrht/odbAr25+wpSO2MPjNNskrV71+P0jalixcSdUsHv9Kc7oej6H42aoW
         zF3hxwp0EE3ZdIZH+OPSOmF0K4M/kILQZQbKtY73nhJpu8IwLu8UKwsevtcS/wtU3QhO
         VSWOeUqhubcYNBQOFRZ9HYzjqTjUcBjsm4xTEOzOXL2byf8MVEVbZvnmW7stw1kJ5t6v
         3AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678605424;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJAiYidXikRagrvs8QJrX3AufqF9vXtWgvBYHZzmNh8=;
        b=qoeMN6xebGXvsrkYzD+M+cec8BD1782XdOyTdCfGCCWe1EhQer3fo0i9rU+qn7F+Yx
         i2snRFvOuf/oAP+95YtCS7Sszf2CeqFeHq6IVzlqTjZc1kpDQnV0fQtnMhJ0h7cXlme5
         2rXEf7MX9nMZ+/Ee3qalU2XQ7x7Cppko8GHIQeinWzwpvvJ58NglRyiy/QI5l+7n36Kj
         RpYxtPN/tmFSD0MKCkRzEvbcYLm7z36T1WzSJzC3z7HwtBaH99aQUQbGfPiiaN7TP2Z9
         lCXddB7dqFLnY/nz1bDylPIF5XjgMaXifTBf0crVATX9aa4rmgBXezD8XeAKDaZGFr3I
         SrWw==
X-Gm-Message-State: AO0yUKWRhDq07yhhf30Uv5xCM+8GI4qpm/Bof6JVw/LZ8AQsu1RjuOdA
	MsUd9kLkNEdV2oiJHzeBrmmGG2a+MQulvg==
X-Google-Smtp-Source: AK7set/IHoHq5AN2YzM+IZs3vpDiPFZBI3vA7hTBwFD15l3bL5LAUB8j2fGLBCvxpt3bCf3XsM5pvg==
X-Received: by 2002:a17:902:d4ce:b0:19a:9864:2887 with SMTP id o14-20020a170902d4ce00b0019a98642887mr8029036plg.7.1678605423792;
        Sat, 11 Mar 2023 23:17:03 -0800 (PST)
Received: from ubuntu ([59.89.166.125])
        by smtp.gmail.com with ESMTPSA id le3-20020a170902fb0300b0019f3da7a632sm515115plb.146.2023.03.11.23.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 23:17:03 -0800 (PST)
Date: Sat, 11 Mar 2023 23:17:00 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: fmdefrancesco@gmail.com
Cc: GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com, error27@gmail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, manishc@marvell.com,
	netdev@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: qlge: Remove parenthesis around single condition
Message-ID: <20230312071700.GH14247@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1713523.QkHrqEjB74@suse>

Hi Fabio,

Thank you for the insights. I went to the .rst files because they are directly linked in the first-patch document. I also noticed the difference between a ".rst" file and its counter human readable ".html" file. You were right that many information is being missed when anyone will read the .rst instead of .html/.pdf. I would like to suggest that the links that redirect to the .rst source files in the first-patch document must be changed to the links that redirect to there corresponding human readable format. Let me know if I could do it under the [KERNEL NEWBIEs ACCESS]. 

Apart from this I will be happy to patch the style guide after this
contribution period.

Regards,

Sumitra

