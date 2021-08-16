Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEFE173
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 16:06:23 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id w5so32717767ejq.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 09:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsy2FFIBDpdnQxdOvpG9locBJTuLRwcWpIcYnX7FKsU=;
        b=qfFjXJilL0XaJ2SeS8oxPfhd5ufAEH/X7lue4BRTV8JzCIwd2D7kvAxp/XL4+S2R0V
         DHUeY75bNZ0Mv50Gkn9d9G3EcXCbTXSoSTgeuOZslu+Pki+M+g8wxxG0eoXLqE5VZQxF
         Eg8BIsGj5f1U7OunLzT3HfqTa4JRp76htrt0PrJRjW8WnetQUzrdfPoSUszbqvS23Q3P
         wbIcNlk5wP+ua7s5yFugD3Ke66T8dcgfCZNXC0BDbAz+vb9LvGHIvOIdLfG2XzvtdMSZ
         qbmIE9kxFDu3AeqCQMkmJrXWCPtH0Ur2wIWmBsO5FGM2+t5zBz86E7L9xseoyNZoGc0V
         9qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsy2FFIBDpdnQxdOvpG9locBJTuLRwcWpIcYnX7FKsU=;
        b=YkyClk/JWAXbAOl5BfkgclXIp/e/ywwNxKpOTSZt7fZvwU0zWHSWjlvbd5Mur7DF+a
         0Gp8diPkoaWifF9HFHmPXRDwDDc6UacLX8LaGAdGUxoNkMaetDXmeMsCpqAngfYrK9U1
         B0vkQ7K25diy9B73yf8pAkIOpHMM94bhjQvX3jC90LD3gSeqlRBtrf3pWLfPHbIMRDat
         RnuH3eujcdMI5BGyg6e0lbfQKhaInAp7ACE+brRsx0qT4XipYs0j3i4uNXn7vMmSVkFG
         IWqCDCC6Jiv3bilEFrig1pJCmPAgMvzIwXU/IH9+5oH6UPEg+TJExDtgwqFDqHwcEUQW
         oyFA==
X-Gm-Message-State: AOAM531o4NTJtYBsp3q8V0aoNiCoVKuqCsL8NWqHURT5Ct/gMOeNXQN0
	YA3CxcbiIyn5GGgQpwtwe0Y=
X-Google-Smtp-Source: ABdhPJzT87VMKMpXyWRXG5sJlR82C6kk8DrLKbkY1qZXSY3uI4KGtX9OtGZwJPaZWdCH5Rpf6Jb2jQ==
X-Received: by 2002:a17:906:e0c:: with SMTP id l12mr16806531eji.301.1629129981737;
        Mon, 16 Aug 2021 09:06:21 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id s18sm3906239ejh.12.2021.08.16.09.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 09:06:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: Remove unused code 
Date: Mon, 16 Aug 2021 18:06:14 +0200
Message-Id: <20210816160617.11949-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused code from the r8188eu driver.

Fabio M. De Francesco (3):
  staging: r8188eu: Remove unused nat25_handle_frame()
  staging: r8188eu: Remove all code depending on the NAT25_LOOKUP method
  staging: r8188eu: Remove no more used variable and function

 drivers/staging/r8188eu/core/rtw_br_ext.c    | 263 +------------------
 drivers/staging/r8188eu/include/recv_osdep.h |   1 -
 drivers/staging/r8188eu/include/rtw_br_ext.h |   1 -
 3 files changed, 1 insertion(+), 264 deletions(-)

-- 
2.32.0

