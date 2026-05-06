Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735622FF22
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 02:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034376; cv=none; b=M4V/dAfGGxZdHVGSXvapTkS1b5DW0Kdg2pMtSpybT9qhmPYfGjOLzMoDEVPkK2ATgBkeGJjk1avKEoLRHRLs6e2SaDsDP4vIqdC9K868xrhQWj1kF78IxN8Q/XWNzim7IEtlYCNBWwAmOjcympk++6QII5csTrasxN3YIWvQ9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034376; c=relaxed/simple;
	bh=QPhhvzCtN7RjKG1i29VvDfvaJbXvOaQOLGUJF7WE+WQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dODuX5uY60aIGMLMhQs8mdPSIcHJd8yTkv2k3KGcnyuCsIljaQfuxNnJaETquSvpM4W2mc4wQ7tm1Vf2URsvWJdKS+jR8TiQ/xy7WPCR5mqG77fqb9jI5JnQ/A2b+NNonxgkv4SIgQxIsbKNKYjD8khfEJcEEYOV4NVRKJt13bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ah0I2piz; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ah0I2piz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778034364; x=1778293564;
	bh=01WFp56DjFQ4YOxRGRsGbNQz67UXuc05ZB85B0chypU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ah0I2pizCuJRrYdN9USoH9hcSCLWJhVv/3qAC+/ohPn6wFV4T/L1ezXS5HbgtRsRv
	 wOeyftOxmak5EszWGKvPTa7pMORjKfxPe9iPPFQmAPiSPrwwtNjc4rBQYrWUlhao6B
	 jMN4zgTIV4e57ej8jllz1nc17gTR4gDs/c3GetrdtpJ4tdVYOEzeWPaUacUY5Qy/HP
	 1r5zdSvHZKsl64kypM4wbqpKL+OoxxwftfRmXNjHt9j3ZDIUNNwrMnaXi/TUQtAQwg
	 Zie9LZBkU98DOK3Opw+d74tEhYtBDjQSPsnpQOc+QjaMkC3IIytxsJnpxTwFK4sKVJ
	 rl2A7tAcwvFRA==
Date: Wed, 06 May 2026 02:26:02 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: David Cardenas <ldcc@proton.me>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: rtl8723bs: fix open parenthesis at end of line
Message-ID: <OorLKjBEmwLMB-OuQC_MerB0GkYg2fsHmJcvxPmc8EFrk7VuBlisVIa90K86InsIr2MjgjoSceOv_PUY0OfsepmQ42JdZIoSvK0pMggDfYI=@proton.me>
Feedback-ID: 66630834:user:proton
X-Pm-Message-ID: fd30c13331ff2b60423f122b7bc78937593704c9
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Function declarations and conditional statements should not end
with an opening parenthesis. Reformat affected functions and
if statements to place the opening condition or first parameter
on the same line as the function name or keyword

Signed-off-by: David <ldcc@proton.me>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 179 +++++++-----------
 1 file changed, 64 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/stagi=
ng/rtl8723bs/hal/HalPhyRf_8723B.c
index 6ab65e9e8..59b8f7e99 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -30,6 +30,7 @@ static u8 DeltaSwingTableIdx_2GA_N_8188E[] =3D {
        0, 0, 0, 2, 2, 3, 3, 4,  4,  4,  4,  5,  5,  6,  6,
        7, 7, 7, 7, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 11
 };
+
 static u8 DeltaSwingTableIdx_2GA_P_8188E[] =3D {
        0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4,
        4, 4, 4, 5, 5, 7, 7, 8, 8, 8, 9, 9, 9, 9, 9
@@ -39,14 +40,11 @@ static u8 DeltaSwingTableIdx_2GA_P_8188E[] =3D {
 /* 3 Tx Power Tracking */
 /* 3 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */

-
-static void setIqkMatrix_8723B(
-       struct dm_odm_t *pDM_Odm,
-       u8 OFDM_index,
-       u8 RFPath,
-       s32 IqkResult_X,
-       s32 IqkResult_Y
-)
+static void setIqkMatrix_8723B(struct dm_odm_t *pDM_Odm,
+                               u8 OFDM_index,
+                               u8 RFPath,
+                               s32 IqkResult_X,
+                               s32 IqkResult_Y)
 {
        s32 ele_A =3D 0, ele_D, ele_C =3D 0, value32;

@@ -149,12 +147,10 @@ static void setCCKFilterCoefficient(struct dm_odm_t *=
pDM_Odm, u8 CCKSwingIndex)
  *04/23/2012   MHC     Create Version 0.
  *
  *------------------------------------------------------------------------=
---*/
-void ODM_TxPwrTrackSetPwr_8723B(
-       struct dm_odm_t *pDM_Odm,
-       enum pwrtrack_method Method,
-       u8 RFPath,
-       u8 ChannelMappedIndex
-)
+void ODM_TxPwrTrackSetPwr_8723B(struct dm_odm_t *pDM_Odm,
+                                enum pwrtrack_method Method,
+                                u8 RFPath,
+                                u8 ChannelMappedIndex)
 {
        struct adapter *Adapter =3D pDM_Odm->Adapter;
        struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
@@ -287,13 +283,11 @@ void ODM_TxPwrTrackSetPwr_8723B(
                return; /*  This method is not supported. */
 }

-static void GetDeltaSwingTable_8723B(
-       struct dm_odm_t *pDM_Odm,
-       u8 **TemperatureUP_A,
-       u8 **TemperatureDOWN_A,
-       u8 **TemperatureUP_B,
-       u8 **TemperatureDOWN_B
-)
+static void GetDeltaSwingTable_8723B(struct dm_odm_t *pDM_Odm,
+                                     u8 **TemperatureUP_A,
+                                     u8 **TemperatureDOWN_A,
+                                     u8 **TemperatureUP_B,
+                                     u8 **TemperatureDOWN_B)
 {
        struct adapter *Adapter =3D pDM_Odm->Adapter;
        struct odm_rf_cal_t *pRFCalibrateInfo =3D &pDM_Odm->RFCalibrateInfo=
;
@@ -340,9 +334,7 @@ void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg =
*pConfig)
 #define MAX_TOLERANCE          5

 /* bit0 =3D 1 =3D> Tx OK, bit1 =3D 1 =3D> Rx OK */
-static u8 phy_PathA_IQK_8723B(
-       struct adapter *padapter, bool configPathB, u8 RF_Path
-)
+static u8 phy_PathA_IQK_8723B(struct adapter *padapter, bool configPathB, =
u8 RF_Path)
 {
        u32 regEAC, regE94, regE9C, tmp, Path_SEL_BB /*, regEA4*/;
        u8 result =3D 0x00;
@@ -425,14 +417,12 @@ static u8 phy_PathA_IQK_8723B(
        if ((tmp & 0x200) > 0)
                tmp =3D 0x400 - tmp;

-       if (
-               !(regEAC & BIT28) &&
+       if (!(regEAC & BIT28) &&
                (((regE94 & 0x03FF0000)>>16) !=3D 0x142) &&
                (((regE9C & 0x03FF0000)>>16) !=3D 0x42) &&
                (((regE94 & 0x03FF0000)>>16) < 0x110) &&
                (((regE94 & 0x03FF0000)>>16) > 0xf0) &&
-               (tmp < 0xf)
-       )
+               (tmp < 0xf))
                result |=3D 0x01;
        else                                    /* if Tx not OK, ignore Rx =
*/
                return result;
@@ -441,9 +431,7 @@ static u8 phy_PathA_IQK_8723B(
 }

 /* bit0 =3D 1 =3D> Tx OK, bit1 =3D 1 =3D> Rx OK */
-static u8 phy_PathA_RxIQK8723B(
-       struct adapter *padapter, bool configPathB, u8 RF_Path
-)
+static u8 phy_PathA_RxIQK8723B(struct adapter *padapter, bool configPathB,=
 u8 RF_Path)
 {
        u32 regEAC, regE94, regE9C, regEA4, u4tmp, tmp, Path_SEL_BB;
        u8 result =3D 0x00;
@@ -524,14 +512,12 @@ static u8 phy_PathA_RxIQK8723B(
        if ((tmp & 0x200) > 0)
                tmp =3D 0x400 - tmp;

-       if (
-               !(regEAC & BIT28) &&
+       if (!(regEAC & BIT28) &&
                (((regE94 & 0x03FF0000)>>16) !=3D 0x142) &&
                (((regE9C & 0x03FF0000)>>16) !=3D 0x42) &&
                (((regE94 & 0x03FF0000)>>16) < 0x110) &&
                (((regE94 & 0x03FF0000)>>16) > 0xf0) &&
-               (tmp < 0xf)
-       )
+               (tmp < 0xf))
                result |=3D 0x01;
        else                            /* if Tx not OK, ignore Rx */
                return result;
@@ -615,14 +601,12 @@ static u8 phy_PathA_RxIQK8723B(
        if ((tmp & 0x200) > 0)
                tmp =3D 0x400 - tmp;

-       if (
-               !(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK=
 */
+       if (!(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK */
                (((regEA4 & 0x03FF0000)>>16) !=3D 0x132) &&
                (((regEAC & 0x03FF0000)>>16) !=3D 0x36) &&
                (((regEA4 & 0x03FF0000)>>16) < 0x110) &&
                (((regEA4 & 0x03FF0000)>>16) > 0xf0) &&
-               (tmp < 0xf)
-       )
+               (tmp < 0xf))
                result |=3D 0x02;

        return result;
@@ -708,14 +692,12 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapte=
r)
        if ((tmp & 0x200) > 0)
                tmp =3D 0x400 - tmp;

-       if (
-               !(regEAC & BIT28) &&
+       if (!(regEAC & BIT28) &&
                (((regE94 & 0x03FF0000)>>16) !=3D 0x142) &&
                (((regE9C & 0x03FF0000)>>16) !=3D 0x42) &&
                (((regE94 & 0x03FF0000)>>16) < 0x110) &&
                (((regE94 & 0x03FF0000)>>16) > 0xf0) &&
-               (tmp < 0xf)
-       )
+               (tmp < 0xf))
                result |=3D 0x01;

        return result;
@@ -803,14 +785,12 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
        if ((tmp & 0x200) > 0)
                tmp =3D 0x400 - tmp;

-       if (
-               !(regEAC & BIT28) &&
+       if (!(regEAC & BIT28) &&
                (((regE94 & 0x03FF0000)>>16) !=3D 0x142) &&
                (((regE9C & 0x03FF0000)>>16) !=3D 0x42)  &&
                (((regE94 & 0x03FF0000)>>16) < 0x110) &&
                (((regE94 & 0x03FF0000)>>16) > 0xf0) &&
-               (tmp < 0xf)
-       )
+               (tmp < 0xf))
                        result |=3D 0x01;
        else    /* if Tx not OK, ignore Rx */
                return result;
@@ -895,26 +875,22 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
        if ((tmp & 0x200) > 0)
                tmp =3D 0x400 - tmp;

-       if (
-               !(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK=
 */
+       if (!(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK */
                (((regEA4 & 0x03FF0000)>>16) !=3D 0x132) &&
                (((regEAC & 0x03FF0000)>>16) !=3D 0x36) &&
                (((regEA4 & 0x03FF0000)>>16) < 0x110) &&
                (((regEA4 & 0x03FF0000)>>16) > 0xf0) &&
-               (tmp < 0xf)
-       )
+               (tmp < 0xf))
                result |=3D 0x02;

        return result;
 }

-static void _PHY_PathAFillIQKMatrix8723B(
-       struct adapter *padapter,
-       bool bIQKOK,
-       s32 result[][8],
-       u8 final_candidate,
-       bool bTxOnly
-)
+static void _PHY_PathAFillIQKMatrix8723B(struct adapter *padapter,
+                                         bool bIQKOK,
+                                         s32 result[][8],
+                                         u8 final_candidate,
+                                         bool bTxOnly)
 {
        u32 Oldval_0, X, TX0_A, reg;
        s32 Y, TX0_C;
@@ -982,13 +958,11 @@ static void _PHY_PathAFillIQKMatrix8723B(
        }
 }

-static void _PHY_PathBFillIQKMatrix8723B(
-       struct adapter *padapter,
-       bool bIQKOK,
-       s32 result[][8],
-       u8 final_candidate,
-       bool bTxOnly /* do Tx only */
-)
+static void _PHY_PathBFillIQKMatrix8723B(struct adapter *padapter,
+                                         bool bIQKOK,
+                                         s32 result[][8],
+                                         u8 final_candidate,
+                                         bool bTxOnly /* do Tx only */)
 {
        u32 Oldval_1, X, TX1_A, reg;
        s32     Y, TX1_C;
@@ -1068,12 +1042,10 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u=
32 RFpath)
        struct odm_rf_cal_t *pRFCalibrateInfo =3D &pDM_Odm->RFCalibrateInfo=
;
        u8 path;

-       if (
-               (pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] !=
=3D 0x0) &&
+       if ((pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] !=3D 0x=
0) &&
                (pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] !=
=3D 0x0) &&
                (pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] !=
=3D 0x0) &&
-               (pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] !=
=3D 0x0)
-       ) {
+               (pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] !=
=3D 0x0)) {
                if (RFpath)
                        path =3D PATH_S0;
                else
@@ -1094,12 +1066,10 @@ static bool ODM_CheckPowerStatus(struct adapter *Ad=
apter)
        return true;
 }

-static void _PHY_SaveADDARegisters8723B(
-       struct adapter *padapter,
-       u32 *ADDAReg,
-       u32 *ADDABackup,
-       u32 RegisterNum
-)
+static void _PHY_SaveADDARegisters8723B(struct adapter *padapter,
+                                        u32 *ADDAReg,
+                                        u32 *ADDABackup,
+                                        u32 RegisterNum)
 {
        u32 i;
        struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
@@ -1114,9 +1084,7 @@ static void _PHY_SaveADDARegisters8723B(
 }


-static void _PHY_SaveMACRegisters8723B(
-       struct adapter *padapter, u32 *MACReg, u32 *MACBackup
-)
+static void _PHY_SaveMACRegisters8723B(struct adapter *padapter, u32 *MACR=
eg, u32 *MACBackup)
 {
        u32 i;
        struct hal_com_data     *pHalData =3D GET_HAL_DATA(padapter);
@@ -1130,12 +1098,10 @@ static void _PHY_SaveMACRegisters8723B(
 }


-static void _PHY_ReloadADDARegisters8723B(
-       struct adapter *padapter,
-       u32 *ADDAReg,
-       u32 *ADDABackup,
-       u32 RegiesterNum
-)
+static void _PHY_ReloadADDARegisters8723B(struct adapter *padapter,
+                                          u32 *ADDAReg,
+                                          u32 *ADDABackup,
+                                          u32 RegiesterNum)
 {
        u32 i;
        struct hal_com_data     *pHalData =3D GET_HAL_DATA(padapter);
@@ -1146,9 +1112,7 @@ static void _PHY_ReloadADDARegisters8723B(
        }
 }

-static void _PHY_ReloadMACRegisters8723B(
-       struct adapter *padapter, u32 *MACReg, u32 *MACBackup
-)
+static void _PHY_ReloadMACRegisters8723B(struct adapter *padapter, u32 *MA=
CReg, u32 *MACBackup)
 {
        u32 i;

@@ -1159,11 +1123,7 @@ static void _PHY_ReloadMACRegisters8723B(
 }


-static void _PHY_PathADDAOn8723B(
-       struct adapter *padapter,
-       u32 *ADDAReg,
-       bool is2T
-)
+static void _PHY_PathADDAOn8723B(struct adapter *padapter, u32 *ADDAReg, b=
ool is2T)
 {
        u32 pathOn;
        u32 i;
@@ -1184,9 +1144,7 @@ static void _PHY_PathADDAOn8723B(

 }

-static void _PHY_MACSettingCalibration8723B(
-       struct adapter *padapter, u32 *MACReg, u32 *MACBackup
-)
+static void _PHY_MACSettingCalibration8723B(struct adapter *padapter, u32 =
*MACReg, u32 *MACBackup)
 {
        u32 i =3D 0;
        struct hal_com_data     *pHalData =3D GET_HAL_DATA(padapter);
@@ -1201,12 +1159,7 @@ static void _PHY_MACSettingCalibration8723B(

 }

-static bool phy_SimularityCompare_8723B(
-       struct adapter *padapter,
-       s32 result[][8],
-       u8  c1,
-       u8  c2
-)
+static bool phy_SimularityCompare_8723B(struct adapter *padapter, s32 resu=
lt[][8], u8  c1, u8  c2)
 {
        u32 i, j, diff, SimularityBitMap, bound =3D 0;
        u8 final_candidate[2] =3D {0xFF, 0xFF}; /* for path A and path B */
@@ -1284,13 +1237,11 @@ static bool phy_SimularityCompare_8723B(



-static void phy_IQCalibrate_8723B(
-       struct adapter *padapter,
-       s32 result[][8],
-       u8 t,
-       bool is2T,
-       u8 RF_Path
-)
+static void phy_IQCalibrate_8723B(struct adapter *padapter,
+                                  s32 result[][8],
+                                  u8 t,
+                                  bool is2T,
+                                  u8 RF_Path)
 {
        struct hal_com_data     *pHalData =3D GET_HAL_DATA(padapter);
        struct dm_odm_t *pDM_Odm =3D &pHalData->odmpriv;
@@ -1544,13 +1495,11 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *=
pDM_Odm, bool is2T)

 /* IQK version:V2.5    20140123 */
 /* IQK is controlled by Is2ant, RF path */
-void PHY_IQCalibrate_8723B(
-       struct adapter *padapter,
-       bool bReCovery,
-       bool bRestore,
-       bool Is2ant,    /* false:1ant, true:2-ant */
-       u8 RF_Path      /* 0:S1, 1:S0 */
-)
+void PHY_IQCalibrate_8723B(struct adapter *padapter,
+                           bool bReCovery,
+                           bool bRestore,
+                           bool Is2ant,        /* false:1ant, true:2-ant *=
/
+                           u8 RF_Path  /* 0:S1, 1:S0 */)
 {
        struct hal_com_data     *pHalData =3D GET_HAL_DATA(padapter);

--
2.43.0
