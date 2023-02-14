Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4E3C02
	for <linux-staging@lists.linux.dev>; Tue, 14 Feb 2023 08:25:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z13so10407945wmp.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Feb 2023 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZn1g1BxSoyDoGO08JTTlZgpJYzAyAHcNUx33niXmng=;
        b=JDcLbhmYNfsn0i8C2ASO7x8qyQmYjnCZgP4WoyveSnnqCkDb+KzJD+Z2fhOsrGPJgf
         W1w9kf2KB6BJxKsJ0HfA52crgUjmbG8xqALdbVztTxXkx295e6tu0ZtR/7uMTFDswSir
         tKf/awKE3bHfAtWTpqiCptrXWn8sj9lqhxab9G+1sSRwb7CcL+GFvw1Sij2694SVIEXc
         Mi6zejpHVDdUxtzzyERRDzp7i0ihUvLBbQFUw3qPYseBhUoVTkJSIFPE1e5miosyuJPV
         2YvJVE5Pt54SuQ3wkHy6TU0rUTCkFLtn4ZRULSlAhiug+3BwX56fyJo9ZY4dbQbSs+J6
         Lt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZn1g1BxSoyDoGO08JTTlZgpJYzAyAHcNUx33niXmng=;
        b=1DSXPvFo9ZHHaFN1n28ssOWkkfy2FVUdOB+EWar6J5ccn0Hf0wk+6TnIpzq9JOORTb
         svaf/pifYAbVwg7ATXqa+92MwfYvcZEwmoyCQXXpiKTfpoqe9bCjCrE3gBYxzLbUPkqr
         ILcn4Uv/x5Rl2TiFzRm5ErMjxe0WZ8U1WKNE6V5Esddz5BjyOp4QL337aLwnBN9Vi54a
         LU7J/RJTp0OWf32y1yAOsl9QpKMtkssTL1e4jF4WkUtGvueuSir49A6K07y7U6Zc3r95
         MS/ZiviYTJ8sXtZd10HlJLMGiHvVXsA/34rxAJMZYJdz4ih1JoF1iEDlaU3ZItIzTKcS
         Mo2A==
X-Gm-Message-State: AO0yUKUkYG9dd17VlXRCoEwma6f082nyagAfV+BeACliAac1j88r5NB9
	K1AUKVsheROkWyJAfvjrVjZL+0p/rROMaQ==
X-Google-Smtp-Source: AK7set/c2JLILyjKx+i3J70UUW0NrcG/g0aClo+B8mFWjoofK5i7EFowng0H8MoZbhDJRliCBv6R2A==
X-Received: by 2002:a05:600c:4d92:b0:3dc:51f6:8f58 with SMTP id v18-20020a05600c4d9200b003dc51f68f58mr1252117wmp.6.1676363138950;
        Tue, 14 Feb 2023 00:25:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003db12112fcfsm18055916wmo.4.2023.02.14.00.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:25:38 -0800 (PST)
Date: Tue, 14 Feb 2023 11:25:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jacob Bai <jacob.bai.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: change (struct pi433_tx_cfg)->bit_rate
 to be a u32
Message-ID: <Y+tFf3dFR812iVbj@kadam>
References: <Y+srSuTdGmzmXG1I@jacob-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+srSuTdGmzmXG1I@jacob-Ubuntu>

On Tue, Feb 14, 2023 at 05:33:46PM +1100, Jacob Bai wrote:
> Based on the TODO file and datasheet of pi433, the maximum bit rate for
> transmitter is 300kbps when modulation been set to FSK. Hence, the size
> should be u32 rather than u16.
> 
> Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
> ---

This breaks the user space API.

The TODO was updated recently to explain how to do this properly.

regards,
dan carpenter

