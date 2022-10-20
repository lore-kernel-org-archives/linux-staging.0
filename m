Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82367B;
	Thu, 20 Oct 2022 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666301501; bh=LsgP4UwxtEr24nRtsoSyg8wVeKuuTajMpOKVYOf6LMM=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=hapW5OMY8pdFZBAQ+Clpu7GXnKmV38IPzd/H74BdajzdfLu+pQ1T82U2SK/T+oEQ7
	 OE/oeKDgauyAn4fItP3iTh9wcmQIpKhnOw34hDqklqOAn3X/N0kKcN+97/9RcK2oVu
	 iLnR5arc0xVM7SSBMEzMDvJ0qtj/xWMbV5Nejt2M=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 23:31:41 +0200 (CEST)
X-EA-Auth: izWFoG7NUcdEXVwGnODSoe5tJ0O4nUX/wq/lYIvP0Q7HLVuJ+AW8kpOABC7CrSHdN7F8eAxQTWRn/ftnZ9w9uOuOukDzkUR4
Date: Fri, 21 Oct 2022 03:01:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: [PATCH v4 09/11] staging: r8188eu: Put '{" on the symbol declaration
 line
Message-ID: <375f742936493b562bd4dfba90eb75bd8ab84f8a.1666299151.git.drv@mailo.com>
References: <cover.1666299151.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666299151.git.drv@mailo.com>

Open braces '{" should be placed on the line of symbol declaration as
per the coding-style guidelines. Improves readability and matches with
style used in rest of the code. Issue reported by checkpatch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v4:
   -- None.

Changes in v3:
   1. Patch newly added to the patch set.


 drivers/staging/r8188eu/include/rtw_cmd.h | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 4b6a91aefc1e..0a138f6f5bbb 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -445,8 +445,7 @@ struct getrfintfs_parm {
 	u8	rfintfs;
 };

-struct Tx_Beacon_param
-{
+struct Tx_Beacon_param {
 	struct wlan_bssid_ex network;
 };

@@ -682,26 +681,22 @@ struct set_ch_parm {
 };

 /*H2C Handler index: 59 */
-struct SetChannelPlan_param
-{
+struct SetChannelPlan_param {
 	u8 channel_plan;
 };

 /*H2C Handler index: 60 */
-struct LedBlink_param
-{
+struct LedBlink_param {
 	struct LED_871x *pLed;
 };

 /*H2C Handler index: 61 */
-struct SetChannelSwitch_param
-{
+struct SetChannelSwitch_param {
 	u8 new_ch_no;
 };

 /*H2C Handler index: 62 */
-struct TDLSoption_param
-{
+struct TDLSoption_param {
 	u8 addr[ETH_ALEN];
 	u8 option;
 };
@@ -859,8 +854,7 @@ enum rtw_h2c_cmd {
 #define _SetRFReg_CMD_		_Write_RFREG_CMD_

 #ifdef _RTW_CMD_C_
-static struct _cmd_callback	rtw_cmd_callback[] =
-{
+static struct _cmd_callback	rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
 	{GEN_CMD_CODE(_Write_MACREG), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
--
2.30.2



