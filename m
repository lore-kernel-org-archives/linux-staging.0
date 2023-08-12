Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C401CCCC
	for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 21:14:00 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso4014127a12.3
        for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691874839; x=1692479639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qN4+JPQ2uMhH474HegNnWcROGyA8dAp5RWQJWrAdXg=;
        b=gFgNBX8i2ETarPsMHY5Nwpour5KM7lxMnTS87CWAozeTybwQL9q2Rb3kTOnNRI97j+
         r/i//H2etz35n45IOeq6yt534e2jH2A44yH+8/sru3i64/uOzJYDWo5ADHM51OMvUuiW
         5z6AIkEj2il96lkFKvQxYqvk4GNv5EFMm7pwKINEShREVSMQlad+4h54SjA9CRwt0iKM
         YaIdFYdISI5qJZOAY0FDLGouscOt5FxryP+tuSa7Rh4kFZxZqV4m83k9KGu/bI+OAvOr
         7GCAj1N1mAOVYWytrqzBqDUvPMY6QnLBmpbLLQBykvub8CYMliJJ0McWg7+bzS+OoQFK
         11/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691874839; x=1692479639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qN4+JPQ2uMhH474HegNnWcROGyA8dAp5RWQJWrAdXg=;
        b=AqzXTO4wQOaqWEriLPsgGl6nPbOqTgS8ROFbFzbWRm0P4JygRiMHnt+EVwWHtg9ByU
         QDKppmibZrLu1Wbg6HqJIV7NjeCJkJMcSWTv+Pl38h+w37Wt+jUVjC8WR01qh3wj9g7K
         x2MLyyBaemaXE/fNw3MYAmUmO/TfLPlCwJ3RszOh6uLDNfwPuF3YO8Ckv35CviEu25+b
         SYs112EnpKM0vCljMeGt/TAj91yNZmBOKAtolqTfegYZ5czQkIStMjjpQNIpa3kOWNTS
         5ZmTrRJT6yO4xn9WJ8uEGTnKva27VHCwVbrwFoxVMEG7YQDSFUaHtyvVP/SzBxIaP13u
         07Zw==
X-Gm-Message-State: AOJu0YxS/5cE6GqZGc/k4AqMtC4KxEE4DAmp3rtWuwCBpaOgjurmBGkw
	p7TJvOLdzmcxkE1btz5YcmA=
X-Google-Smtp-Source: AGHT+IH1wsb9qoAkdoUo98/0EkE5TmD0l13LQU66xkUbR5ROmc684BH2TKxF6ywCJFe7fWDIVYRQMg==
X-Received: by 2002:a05:6402:1b06:b0:522:1956:a291 with SMTP id by6-20020a0564021b0600b005221956a291mr4407137edb.8.1691874838601;
        Sat, 12 Aug 2023 14:13:58 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id c23-20020a056402121700b00523653295f9sm3648305edw.94.2023.08.12.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 14:13:58 -0700 (PDT)
Date: Sat, 12 Aug 2023 23:13:56 +0200
From: Nam Cao <namcaov@gmail.com>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] Staging: rtl8192e: Rename struct rx_ts_record
 references
Message-ID: <ZNf2FJNPF6A4jwcX@nam-dell>
References: <20230812201702.83421-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812201702.83421-1-tdavies@darkphysics.net>

On Sat, Aug 12, 2023 at 01:16:46PM -0700, Tree Davies wrote:
> This patch series fixes checkpatch warning Avoid CamelCase, for all references
> of struct rx_ts_record, and renames them to rx_ts for consistency and 
> readability. Each patch renames references for a single function.
> 
> Thank you in advance to the reviewers
> ~ Tree 
> 
> Tree Davies (16):

Here it says there are 16 patches, but you have only sent 6 patches. Are some
of them missing?

Best regards,
Nam

